import 'package:flutter/material.dart';
import '../models/models.dart'; // Asegúrate de que esta ruta sea correcta

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const NoteCard({
    required this.note,
    required this.onEdit,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEdit, // Permite que la tarjeta sea clicable
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 4,
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          title: Text(
            note.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Ajusta el color del texto a negro
            ),
          ),
          subtitle: Text(
            note.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black, // Ajusta el color del texto a negro
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.black), // Cambia el color del ícono a negro
                onPressed: onEdit,
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.black), // Cambia el color del ícono a negro
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
