import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart'; // Asegúrate de que la ruta sea correcta

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _studentCodeController;
  late TextEditingController _emailController;
  int semester = 1;
  String faculty = 'FADE';

  final List<String> faculties = [
    'FADE', 'FIE', 'Ciencias', 'Mecánica', 'Salud Pública', 'Ciencias Pecuarias'
  ];

  final List<int> semesters = List<int>.generate(10, (i) => i + 1);

  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);

    _firstNameController = TextEditingController(text: profileProvider.firstName);
    _lastNameController = TextEditingController(text: profileProvider.lastName);
    _studentCodeController = TextEditingController(text: profileProvider.studentCode);
    _emailController = TextEditingController(text: profileProvider.email);
    semester = profileProvider.semester;
    faculty = profileProvider.faculty;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _studentCodeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);

    profileProvider.updateProfile(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      studentCode: _studentCodeController.text,
      semester: semester,
      email: _emailController.text,
      faculty: faculty,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración de Perfil'),
        backgroundColor: Color(0xFFFCF7D1),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: constraints.maxWidth * 0.2,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: constraints.maxWidth * 0.15, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: constraints.maxWidth * 0.05),
                  _buildTextField('Nombre', _firstNameController),
                  _buildTextField('Apellido', _lastNameController),
                  _buildTextField('Código Estudiantil', _studentCodeController),
                  _buildDropdown('Semestre', semesters, semester, (value) {
                    setState(() {
                      semester = value as int;
                    });
                  }),
                  _buildTextField('Correo Electrónico', _emailController, email: true),
                  _buildDropdown('Facultad', faculties, faculty, (value) {
                    setState(() {
                      faculty = value as String;
                    });
                  }),
                  SizedBox(height: constraints.maxWidth * 0.05),
                  ElevatedButton(
                    onPressed: _saveProfile,
                    child: Text('Guardar'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool email = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: email ? TextInputType.emailAddress : TextInputType.text,
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
