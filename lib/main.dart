import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/provider.dart'; // Asegúrate de que la ruta sea correcta
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/help_screen.dart';
import 'screens/user_help_screen.dart';
import 'screens/add_task_screen.dart';
import 'screens/add_note_screen.dart';
import 'screens/add_reminder_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: MaterialApp(
        title: 'Tareas Poli',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false, // Línea añadida para eliminar la cinta de debug
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/profile': (context) => ProfileScreen(), // Sin parámetros
          '/settings': (context) => SettingsScreen(), // Sin parámetros
          '/help': (context) => HelpScreen(),
          '/user_help': (context) => UserHelpScreen(),
          '/add_task': (context) => AddTaskScreen(onSave: (task) {
            // Manejo para agregar tarea
          }),
          '/add_note': (context) => AddNoteScreen(onSave: (note) {
            // Manejo para agregar nota
          }),
          '/add_reminder': (context) => AddReminderScreen(onSave: (reminder) {
            // Manejo para agregar recordatorio
          }),
        },
      ),
    );
  }
}
