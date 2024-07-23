import 'package:flutter/material.dart';
import 'package:tareas_poli/widgets/widgets.dart';

import '../models/models.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(Task) onSave;

  const AddTaskScreen({required this.onSave, Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _nameController = TextEditingController();
  final _subjectController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _saveTask() {
    final name = _nameController.text;
    final subject = _subjectController.text;
    final description = _descriptionController.text;
    
    if (name.isEmpty || subject.isEmpty || description.isEmpty) {
      return;
    }

    final task = Task(
      name: name,
      subject: subject,
      description: description,
      date: _selectedDate,
    );

    widget.onSave(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre de la Tarea'),
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
                  onPressed: () async {
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
                  },
                  child: Text('Seleccionar Fecha'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _saveTask,
              child: Text('Guardar Tarea'),
            ),
          ],
        ),
      ),
    );
  }
}
