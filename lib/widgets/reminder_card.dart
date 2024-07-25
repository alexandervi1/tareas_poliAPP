import 'package:flutter/material.dart';
import '../models/models.dart'; // Asegúrate de que esta ruta sea correcta

class ReminderCard extends StatelessWidget {
  final Reminder reminder;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ReminderCard({
    required this.reminder,
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
            reminder.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Ajusta el color del texto si es necesario
            ),
          ),
          subtitle: Text(
            reminder.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black, // Ajusta el color del texto si es necesario
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.black), // Ajusta el color del ícono si es necesario
                onPressed: onEdit,
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.black), // Ajusta el color del ícono si es necesario
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
