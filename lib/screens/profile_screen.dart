import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text('Nombre: Juan Pérez', style: TextStyle(fontSize: 18)),
            Text('Apellido: Rodríguez', style: TextStyle(fontSize: 18)),
            Text('Código Estudiantil: 123456', style: TextStyle(fontSize: 18)),
            Text('Semestre: 3', style: TextStyle(fontSize: 18)),
            Text('Correo Electrónico: juan.perez@espoch.edu.ec', style: TextStyle(fontSize: 18)),
            Text('Facultad: FADE', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
