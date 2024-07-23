import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/models.dart';
import '../providers/user_provider.dart';  // Importa el archivo user_provider.dart
import '../screens/add_note_screen.dart';
import '../screens/add_reminder_screen.dart';
import '../screens/add_task_screen.dart';
import '../screens/help_screen.dart';  // Importa el archivo help_screen.dart
import '../screens/login_screen.dart';  // Importa el archivo login_screen.dart
import '../screens/profile_screen.dart';  // Importa el archivo profile_screen.dart
import '../screens/register_screen.dart';  // Importa el archivo register_screen.dart
import '../screens/settings_screen.dart';  // Importa el archivo settings_screen.dart
import '../screens/user_help_screen.dart';  // Importa el archivo user_help_screen.dart
import 'widgets/widgets.dart';  // Importa el archivo widgets.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),  // Inicialmente muestra la pantalla de inicio de sesión
        routes: {
          '/profile': (context) => ProfileScreen(),
          '/settings': (context) => SettingsScreen(profileData: true),  // Asegúrate de definir SettingsScreen
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/help': (context) => HelpScreen(),
          '/user_help': (context) => UserHelpScreen(),
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];
  final List<Note> _notes = [];
  final List<Reminder> _reminders = [];

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
    // Implementa la lógica para editar una tarea
  }

  void _editNote(Note note) {
    // Implementa la lógica para editar una nota
  }

  void _editReminder(Reminder reminder) {
    // Implementa la lógica para editar un recordatorio
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCF7D1),  // Color de la barra
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
      ),
      backgroundColor: Colors.white,  // Color de fondo de la app
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Tus Tareas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: _tasks.map((task) {
                return TaskCard(
                  task: task,
                  onEdit: _editTask,
                  onDelete: () => _deleteTask(task),
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Tus Notas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: _notes.map((note) {
                return NoteCard(
                  note: note,
                  onEdit: _editNote,
                  onDelete: () => _deleteNote(note),
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Tus Recordatorios',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: _reminders.map((reminder) {
                return ReminderCard(
                  reminder: reminder,
                  onEdit: _editReminder,
                  onDelete: () => _deleteReminder(reminder),
                );
              }).toList(),
            ),
          ],
        ),
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
                    title: const Text('Agregar Nota'),
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
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
                Navigator.pushNamed(context, '/settings'); // Asegúrate de que '/settings' esté en las rutas
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ayuda'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/help');  // Cambiado a '/help'
              },
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: Text('Ayuda al Usuario'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/user_help');  // Cambiado a '/user_help'
              },
            ),
          ],
        ),
      ),
    );
  }
}
