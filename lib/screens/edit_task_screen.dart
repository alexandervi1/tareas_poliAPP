import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  final Function(Task) onSave;

  const EditTaskScreen({required this.task, required this.onSave, Key? key}) : super(key: key);

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _nameController;
  late TextEditingController _subjectController;
  late TextEditingController _descriptionController;
  late DateTime _dueDate;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.task.name); // Cambié a task.name
    _subjectController = TextEditingController(text: widget.task.subject); // Añadido para el subject
    _descriptionController = TextEditingController(text: widget.task.description);
    _dueDate = widget.task.date; // Cambié a task.date para coincidir con el modelo actualizado
  }

  void _saveTask() {
    if (_nameController.text.isEmpty || _descriptionController.text.isEmpty) {
      // Validación básica
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Todos los campos son obligatorios')),
      );
      return;
    }

    final updatedTask = widget.task.copyWith(
      name: _nameController.text, // Cambié a task.name
      subject: _subjectController.text, // Añadido para el subject
      description: _descriptionController.text,
      date: _dueDate, // Cambié a task.date
    );
    widget.onSave(updatedTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Tarea'),
        backgroundColor: Color(0xFFFCF7D1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(labelText: 'Materia'), // Añadido para el subject
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 16),
            Text('Fecha de Vencimiento: ${DateFormat('dd/MM/yyyy').format(_dueDate)}'),
            ElevatedButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _dueDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null && pickedDate != _dueDate) {
                  setState(() {
                    _dueDate = pickedDate;
                  });
                }
              },
              child: Text('Seleccionar Fecha'),
            ),
            SizedBox(height: 16),
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
