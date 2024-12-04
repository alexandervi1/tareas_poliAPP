import 'package:flutter/material.dart';

class UserHelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda al Usuario'),
        backgroundColor: Color(0xFFFCF7D1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildHelpSection('Preguntas Frecuentes', 'Encuentre respuestas a las preguntas más comunes.'),
            _buildHelpSection('Soporte Técnico', 'Póngase en contacto con el soporte técnico para obtener ayuda.'),
            _buildHelpSection('Términos y Condiciones', 'Lea los términos y condiciones de uso de la aplicación.'),
            _buildHelpSection('Política de Privacidad', 'Lea nuestra política de privacidad.'),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        child: ListTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(content),
        ),
      ),
    );
  }
}
