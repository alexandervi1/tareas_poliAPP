import 'package:flutter/material.dart';
import 'package:tareas_poli/widgets/widgets.dart';

import '../models/models.dart';

class AddNoteScreen extends StatefulWidget {
  final Function(Note) onSave;

  const AddNoteScreen({required this.onSave, Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _subjectController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _saveNote() {
    final title = _titleController.text;
    final subject = _subjectController.text;
    final description = _descriptionController.text;
    
    if (title.isEmpty || subject.isEmpty || description.isEmpty) {
      return;
    }

    final note = Note(
      title: title,
      subject: subject,
      description: description,
      date: _selectedDate,
    );

    widget.onSave(note);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Nota'),
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
              onPressed: _saveNote,
              child: Text('Guardar Nota'),
            ),
          ],
        ),
      ),
    );
  }
}
