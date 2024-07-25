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
        color: note.color, // Asigna el color de la tarjeta
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          title: Text(
            note.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _getTextColor(note.color), // Ajusta el color del texto
            ),
          ),
          subtitle: Text(
            note.description,
            style: TextStyle(
              fontSize: 16,
              color: _getTextColor(note.color), // Ajusta el color del texto
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: _getIconColor(note.color)), // Ajusta el color del ícono
                onPressed: onEdit,
              ),
              IconButton(
                icon: Icon(Icons.delete, color: _getIconColor(note.color)), // Ajusta el color del ícono
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTextColor(Color backgroundColor) {
    // Retorna el color del texto basado en el color de fondo
    return (backgroundColor.computeLuminance() > 0.5) ? Colors.black : Colors.white;
  }

  Color _getIconColor(Color backgroundColor) {
    // Retorna el color del ícono basado en el color de fondo
    return (backgroundColor.computeLuminance() > 0.5) ? Colors.black : Colors.white;
  }
}
