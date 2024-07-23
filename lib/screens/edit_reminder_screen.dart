import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';

class EditReminderScreen extends StatefulWidget {
  final Reminder reminder;
  final Function(Reminder) onSave;

  const EditReminderScreen({required this.reminder, required this.onSave, Key? key}) : super(key: key);

  @override
  _EditReminderScreenState createState() => _EditReminderScreenState();
}

class _EditReminderScreenState extends State<EditReminderScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.reminder.title);
    _descriptionController = TextEditingController(text: widget.reminder.description);
    _selectedDate = widget.reminder.date;
  }

  void _saveReminder() {
    final updatedReminder = widget.reminder.copyWith(
      title: _titleController.text,
      description: _descriptionController.text,
      date: _selectedDate,
    );
    widget.onSave(updatedReminder);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Recordatorio'),
        backgroundColor: Color(0xFFFCF7D1), // Color de la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título del Recordatorio'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 16),
            Text('Fecha: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'),
            ElevatedButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null && pickedDate != _selectedDate) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              child: Text('Seleccionar Fecha'),
            ),
            SizedBox(height: 16),
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
