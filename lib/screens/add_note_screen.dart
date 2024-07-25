import 'package:flutter/material.dart';
import '../models/models.dart'; // Asegúrate de que la ruta sea correcta

class AddNoteScreen extends StatefulWidget {
  final Function(Note) onSave;

  const AddNoteScreen({required this.onSave, Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  Color _selectedColor = Color(0xFFFCF7D1); // Color predeterminado

  void _saveNote() {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isEmpty || content.isEmpty) {
      return;
    }

    final note = Note(
      title: title,
      subject: '', // No se usa el campo de materia en esta versión
      description: content,
      date: DateTime.now(),
      color: _selectedColor, // Asignar el color a la nota
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
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Contenido'),
              maxLines: 5, // Permite múltiples líneas para el contenido
            ),
            SizedBox(height: 20),
            Text('Color de Nota'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildColorOption(Colors.red),
                _buildColorOption(Colors.orange),
                _buildColorOption(Colors.yellow),
                _buildColorOption(Colors.green),
                _buildColorOption(Colors.blue),
                _buildColorOption(Colors.purple),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Guardar Nota'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: _selectedColor == color ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
