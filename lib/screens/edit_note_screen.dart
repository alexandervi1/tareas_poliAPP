import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';

class EditNoteScreen extends StatefulWidget {
  final Note note;
  final Function(Note) onSave;

  const EditNoteScreen({required this.note, required this.onSave, Key? key}) : super(key: key);

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _subjectController;
  late TextEditingController _descriptionController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _subjectController = TextEditingController(text: widget.note.subject);
    _descriptionController = TextEditingController(text: widget.note.description);
    _selectedDate = widget.note.date;
  }

  void _saveNote() {
    final updatedNote = widget.note.copyWith(
      title: _titleController.text,
      subject: _subjectController.text,
      description: _descriptionController.text,
      date: _selectedDate,
    );
    widget.onSave(updatedNote);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Nota'),
        backgroundColor: Color(0xFFFCF7D1), // Color de la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título de la Nota'),
            ),
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(labelText: 'Materia'),
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
              onPressed: _saveNote,
              child: Text('Guardar Nota'),
            ),
          ],
        ),
      ),
    );
  }
}
