import 'package:flutter/material.dart';

import '../models/models.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  
  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    // Implementa la lógica para actualizar una tarea
    notifyListeners();
  }
}

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote (Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void removeNote (Note note) {
    _notes.remove(note);
    notifyListeners();
  }

  void updateNote (Note note) {
    // Implementa la lógica para actualizar una nota
    notifyListeners();
  }
}

class ReminderProvider with ChangeNotifier {
  List<Reminder> _reminders = [];

  List<Reminder> get reminders => _reminders;

  void addReminder (Reminder reminder) {
    _reminders.add(reminder);
    notifyListeners();
  }

  void removeReminder (Reminder reminder) {
    _reminders.remove(reminder);
    notifyListeners();
  }

  void updateReminder (Reminder reminder) {
    // Implementa la lógica para actualizar un recordatorio
    notifyListeners();
  }
}
