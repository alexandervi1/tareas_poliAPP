import 'dart:ui';

/// Representa una tarea.
class Task {
  final String name;
  final String subject;
  final String description;
  final DateTime date;
  final Color color; // Agrega esta línea

  Task({
    required this.name,
    required this.subject,
    required this.description,
    required this.date,
    required this.color, // Agrega esta línea
  });

  get time => null;

  Task copyWith({
    String? name,
    String? subject,
    String? description,
    DateTime? date,
    Color? color, // Agrega esta línea
  }) {
    return Task(
      name: name ?? this.name,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      date: date ?? this.date,
      color: color ?? this.color, // Agrega esta línea
    );
  }

  /// Devuelve la descripción de la tarea.
  String get content => description;
}

/// Representa una nota.
class Note {
  final String title;
  final String subject;
  final String description;
  final DateTime date;
  final Color color;

  Note({
    required this.title,
    required this.subject,
    required this.description,
    required this.date,
    required this.color,
  });

  Note copyWith({
    String? title,
    String? subject,
    String? description,
    DateTime? date,
    Color? color,
  }) {
    return Note(
      title: title ?? this.title,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      date: date ?? this.date,
      color: color ?? this.color,
    );
  }

  /// Devuelve el contenido de la nota.
  String get content => description;
}

/// Representa un recordatorio.
class Reminder {
  final String title;
  final String subject;
  final String description;
  final DateTime date;
  final Color color; // Agrega esta línea

  Reminder({
    required this.title,
    required this.subject,
    required this.description,
    required this.date,
    required this.color, // Agrega esta línea
  });

  get time => null;

  Reminder copyWith({
    String? title,
    String? subject,
    String? description,
    DateTime? date,
    Color? color, // Agrega esta línea
  }) {
    return Reminder(
      title: title ?? this.title,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      date: date ?? this.date,
      color: color ?? this.color, // Agrega esta línea
    );
  }

  /// Devuelve los detalles del recordatorio.
  String get details => description;
}
