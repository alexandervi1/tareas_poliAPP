import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart'; // Asegúrate de que la ruta sea correcta
import '../screens/settings_screen.dart'; // Importa SettingsScreen aquí


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text('Nombre: ${profileProvider.firstName} ${profileProvider.lastName}'),
            Text('Código Estudiantil: ${profileProvider.studentCode}'),
            Text('Semestre: ${profileProvider.semester}'),
            Text('Correo Electrónico: ${profileProvider.email}'),
            Text('Facultad: ${profileProvider.faculty}'),
            SizedBox(height: 20),
            ElevatedButton(
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
          ],
        ),
      ),
    );
  }
}
