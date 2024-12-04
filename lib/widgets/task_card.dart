import 'package:flutter/material.dart';
import '../models/models.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskCard({
    required this.task,
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          title: Text(
            task.name, // Cambié a task.name para coincidir con el modelo actualizado
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Ajusta el color del texto si es necesario
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                task.subject,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54, // Ajusta el color del texto si es necesario
                ),
              ),
              SizedBox(height: 4),
              Text(
                task.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45, // Ajusta el color del texto si es necesario
                ),
              ),
            ],
          ),
          trailing: Wrap(
            spacing: 12, // Espacio entre los íconos
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit, color: Colors.black),
                onPressed: onEdit,
                tooltip: 'Editar', // Añadido para accesibilidad
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.black),
                onPressed: onDelete,
                tooltip: 'Eliminar', // Añadido para accesibilidad
              ),
            ],
          ),
        ),
      ),
    );
  }
}
