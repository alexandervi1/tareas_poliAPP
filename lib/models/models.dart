// Modelo para una tarea
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

  get title => null;

  DateTime? get dueDate => null;

  get id => null;

  copyWith({required String title, required String description, required DateTime dueDate}) {}
}

// Modelo para una nota
class Note {
  final String title;
  final String subject;
  final String description;
  final DateTime date;

  Note({
    required this.title,
    required this.subject,
    required this.description,
    required this.date,
  });

  Object? get id => null;

  copyWith({required String title, required String subject, required String description, required DateTime date}) {}
}

// Modelo para un recordatorio
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

  get id => null;

  copyWith({required String title, required String description, required DateTime date}) {}
}
