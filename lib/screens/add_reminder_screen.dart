import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tareas_poli/widgets/widgets.dart';
import '../models/models.dart';

// Inicialización del plugin de notificaciones (debe estar en tu main.dart)
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class AddReminderScreen extends StatefulWidget {
  final Function(Reminder) onSave;

  const AddReminderScreen({required this.onSave, Key? key}) : super(key: key);

  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final _titleController = TextEditingController();
  final _subjectController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now(); // Agrega esta línea para hora

  void _saveReminder() {
    final title = _titleController.text;
    final subject = _subjectController.text;
    final description = _descriptionController.text;

    if (title.isEmpty || subject.isEmpty || description.isEmpty) {
      return;
    }

    final reminderDateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    final reminder = Reminder(
      title: title,
      subject: subject,
      description: description,
      date: reminderDateTime,
      color: Colors.blue, // Color por defecto
    );

    // Programar la notificación
    _scheduleNotification(reminderDateTime, title, description);

    widget.onSave(reminder);
    Navigator.pop(context);
  }

  void _scheduleNotification(DateTime scheduledDateTime, String title, String description) {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'reminder_channel_id',
      'Reminder Notifications',
      channelDescription: 'Channel for reminder notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    flutterLocalNotificationsPlugin.schedule(
      0,
      title,
      description,
      scheduledDateTime,
      platformChannelSpecifics,
    );
  }

  void _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _selectTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Recordatorio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(labelText: 'Materia'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Fecha: ${_selectedDate.toLocal().toShortDateString()}'),
                TextButton(
                  onPressed: _selectDate,
                  child: Text('Seleccionar Fecha'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Hora: ${_selectedTime.format(context)}'),
                TextButton(
                  onPressed: _selectTime,
                  child: Text('Seleccionar Hora'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveReminder,
              child: Text('Guardar Recordatorio'),
            ),
          ],
        ),
      ),
    );
  }
}
