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
    if (_titleController.text.isEmpty || _subjectController.text.isEmpty || _descriptionController.text.isEmpty) {
      // Muestra un mensaje de error si algún campo está vacío
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos.')),
      );
      return;
    }
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
              decoration: InputDecoration(
                labelText: 'Título de la Nota',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(
                labelText: 'Materia',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Fecha: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                  style: TextStyle(fontSize: 16),
                ),
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
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Guardar Nota'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Color(0xFFFCF7D1), // Color del texto del botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}
