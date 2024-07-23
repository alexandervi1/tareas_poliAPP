import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final bool profileData;

  SettingsScreen({required this.profileData});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String firstName = '';
  String lastName = '';
  String studentCode = '';
  int semester = 1;
  String email = '';
  String faculty = 'FADE';

  final List<String> faculties = [
    'FADE', 'FIE', 'Ciencias', 'Mecánica', 'Salud Pública', 'Ciencias Pecuarias'
  ];

  final List<int> semesters = List<int>.generate(10, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              SizedBox(height: 20),
              _buildTextField('Nombre', (value) => firstName = value),
              _buildTextField('Apellido', (value) => lastName = value),
              _buildTextField('Código Estudiantil', (value) => studentCode = value),
              _buildDropdown('Semestre', semesters, semester, (value) {
                setState(() {
                  semester = value as int;
                });
              }),
              _buildTextField('Correo Electrónico', (value) => email = value),
              _buildDropdown('Facultad', faculties, faculty, (value) {
                setState(() {
                  faculty = value as String;
                });
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implementa la lógica para guardar los datos del perfil
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDropdown<T>(String label, List<T> items, T value, Function(T?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<T>>((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(item.toString()),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
