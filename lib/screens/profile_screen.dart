import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart'; // Asegúrate de que la ruta sea correcta
import 'settings_screen.dart'; // Importa SettingsScreen

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color(0xFFFCF7D1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: constraints.maxWidth * 0.15, // Ajusta el tamaño del avatar
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: constraints.maxWidth * 0.1, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Nombre: ${profileProvider.firstName} ${profileProvider.lastName}', style: TextStyle(fontSize: 18)),
                  Text('Código Estudiantil: ${profileProvider.studentCode}', style: TextStyle(fontSize: 18)),
                  Text('Semestre: ${profileProvider.semester}', style: TextStyle(fontSize: 18)),
                  Text('Correo Electrónico: ${profileProvider.email}', style: TextStyle(fontSize: 18)),
                  Text('Facultad: ${profileProvider.faculty}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsScreen(),
                          ),
                        );
                      },
                      child: Text('Editar Perfil'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
