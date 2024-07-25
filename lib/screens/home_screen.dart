import 'package:flutter/material.dart';
import '../models/models.dart';
import 'add_task_screen.dart';
import 'add_note_screen.dart';
import 'add_reminder_screen.dart';
import 'edit_task_screen.dart';
import 'edit_note_screen.dart';
import 'edit_reminder_screen.dart';
import '../custom_search_delegate.dart'; // Importa CustomSearchDelegate
import '../widgets/task_card.dart'; // Asegúrate de que la ruta es correcta
import '../widgets/note_card.dart'; // Asegúrate de que la ruta es correcta
import '../widgets/reminder_card.dart'; // Asegúrate de que la ruta es correcta

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];
  final List<Note> _notes = [];
  final List<Reminder> _reminders = [];
  String _searchQuery = '';

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _addNote(Note note) {
    setState(() {
      _notes.add(note);
    });
  }

  void _addReminder(Reminder reminder) {
    setState(() {
      _reminders.add(reminder);
    });
  }

  void _editTask(Task task) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTaskScreen(
          task: task,
          onSave: (updatedTask) {
            setState(() {
              int index = _tasks.indexOf(task);
              if (index != -1) {
                _tasks[index] = updatedTask;
              }
            });
          },
        ),
      ),
    );
  }

  void _editNote(Note note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNoteScreen(
          note: note,
          onSave: (updatedNote) {
            setState(() {
              int index = _notes.indexOf(note);
              if (index != -1) {
                _notes[index] = updatedNote;
              }
            });
          },
        ),
      ),
    );
  }

  void _editReminder(Reminder reminder) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditReminderScreen(
          reminder: reminder,
          onSave: (updatedReminder) {
            setState(() {
              int index = _reminders.indexOf(reminder);
              if (index != -1) {
                _reminders[index] = updatedReminder;
              }
            });
          },
        ),
      ),
    );
  }

  void _deleteTask(Task task) {
    setState(() {
      _tasks.remove(task);
    });
  }

  void _deleteNote(Note note) {
    setState(() {
      _notes.remove(note);
    });
  }

  void _deleteReminder(Reminder reminder) {
    setState(() {
      _reminders.remove(reminder);
    });
  }

  void _confirmDeleteTask(Task task) {
    _confirmDelete(
      'Confirmar Eliminación',
      '¿Estás seguro de que quieres eliminar esta tarea?',
      () => _deleteTask(task),
    );
  }

  void _confirmDeleteNote(Note note) {
    _confirmDelete(
      'Confirmar Eliminación',
      '¿Estás seguro de que quieres eliminar esta nota?',
      () => _deleteNote(note),
    );
  }

  void _confirmDeleteReminder(Reminder reminder) {
    _confirmDelete(
      'Confirmar Eliminación',
      '¿Estás seguro de que quieres eliminar este recordatorio?',
      () => _deleteReminder(reminder),
    );
  }

  void _confirmDelete(String title, String content, VoidCallback onDelete) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Eliminar'),
              onPressed: () {
                Navigator.of(context).pop();
                onDelete();
              },
            ),
          ],
        );
      },
    );
  }

  void _performSearch() async {
    await showSearch<dynamic>(
      context: context,
      delegate: CustomSearchDelegate(
        tasks: _tasks,
        notes: _notes,
        reminders: _reminders,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFCF7D1),
          title: Text('Mi Aplicación'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _performSearch, // Usa el método de búsqueda
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tareas'),
              Tab(text: 'Notas'),
              Tab(text: 'Recordatorios'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            _buildTaskList(),
            _buildNoteList(),
            _buildReminderList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.add_task),
                      title: Text('Agregar Tarea'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTaskScreen(onSave: _addTask),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.note_add),
                      title: Text('Agregar Nota'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNoteScreen(onSave: _addNote),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.alarm_add),
                      title: Text('Agregar Recordatorio'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddReminderScreen(onSave: _addReminder),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
          backgroundColor: Color(0xFFFCF7D1),
          child: Icon(Icons.add),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFFCF7D1),
                ),
                child: Text(
                  'Menú',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Perfil'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configuración de Perfil'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Ayuda'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/help');
                },
              ),
              ListTile(
                leading: Icon(Icons.support),
                title: Text('Ayuda al Usuario'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/user_help');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    final filteredTasks = _tasks
        .where((task) => task.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
    if (filteredTasks.isEmpty) {
      return Center(child: Text('No tienes tareas aún.'));
    }
    return ListView(
      children: filteredTasks.map((task) {
        return TaskCard(
          task: task,
          onEdit: () => _editTask(task),
          onDelete: () => _confirmDeleteTask(task),
        );
      }).toList(),
    );
  }

  Widget _buildNoteList() {
    final filteredNotes = _notes
        .where((note) => note.title.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
    if (filteredNotes.isEmpty) {
      return Center(child: Text('No tienes notas aún.'));
    }
    return ListView(
      children: filteredNotes.map((note) {
        return NoteCard(
          note: note,
          onEdit: () => _editNote(note),
          onDelete: () => _confirmDeleteNote(note),
        );
      }).toList(),
    );
  }

  Widget _buildReminderList() {
    final filteredReminders = _reminders
        .where((reminder) => reminder.title.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
    if (filteredReminders.isEmpty) {
      return Center(child: Text('No tienes recordatorios aún.'));
    }
    return ListView(
      children: filteredReminders.map((reminder) {
        return ReminderCard(
          reminder: reminder,
          onEdit: () => _editReminder(reminder),
          onDelete: () => _confirmDeleteReminder(reminder),
        );
      }).toList(),
    );
  }
}
