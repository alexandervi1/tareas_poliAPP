import 'package:flutter/material.dart';
import '/models/models.dart';

// Widget para mostrar una tarea
class TaskCard extends StatelessWidget {
  final Task task;
  final Function(Task) onEdit;
  final VoidCallback onDelete;

  const TaskCard({
    required this.task,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(task.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('Materia: ${task.subject}\nDescripción: ${task.description}\nFecha: ${task.date.toLocal().toShortDateString()}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => onEdit(task),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para mostrar una nota
class NoteCard extends StatelessWidget {
  final Note note;
  final Function(Note) onEdit;
  final VoidCallback onDelete;

  const NoteCard({
    required this.note,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(note.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('Materia: ${note.subject}\nDescripción: ${note.description}\nFecha: ${note.date.toLocal().toShortDateString()}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => onEdit(note),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para mostrar un recordatorio
class ReminderCard extends StatelessWidget {
  final Reminder reminder;
  final Function(Reminder) onEdit;
  final VoidCallback onDelete;

  const ReminderCard({
    required this.reminder,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(reminder.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('Materia: ${reminder.subject}\nDescripción: ${reminder.description}\nFecha: ${reminder.date.toLocal().toShortDateString()}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => onEdit(reminder),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

// Extensión para formatear fechas
extension DateTimeExtension on DateTime {
  String toShortDateString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}
