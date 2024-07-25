import 'dart:ui';

class Task {
  final String name;
  final String subject;
  final String description;
  final DateTime date;

  Task({
    required this.name,
    required this.subject,
    required this.description,
    required this.date,
  });

  Task copyWith({
    String? name,
    String? subject,
    String? description,
    DateTime? date,
  }) {
    return Task(
      name: name ?? this.name,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }
}

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

  // Si content puede ser nulo, usa String? en lugar de String
  String get content => description; // Devuelve un valor no nulo por defecto

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
}

class Reminder {
  final String title;
  final String subject;
  final String description;
  final DateTime date;

  Reminder({
    required this.title,
    required this.subject,
    required this.description,
    required this.date,
  });

  // Si details puede ser nulo, usa String? en lugar de String
  String get details => description; // Devuelve un valor no nulo por defecto

  Reminder copyWith({
    String? title,
    String? subject,
    String? description,
    DateTime? date,
  }) {
    return Reminder(
      title: title ?? this.title,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }
}
