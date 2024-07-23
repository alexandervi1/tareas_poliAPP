import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildHelpSection(
              'Cómo agregar una nueva tarea',
              'Para agregar una nueva tarea, haga clic en el botón de agregar en la parte inferior de la pantalla y seleccione "Agregar Nueva Tarea". Complete los detalles de la tarea y guárdela.',
            ),
            _buildHelpSection(
              'Cómo agregar una nueva nota',
              'Para agregar una nueva nota, haga clic en el botón de agregar en la parte inferior de la pantalla y seleccione "Agregar Nueva Nota". Complete los detalles de la nota y guárdela.',
            ),
            _buildHelpSection(
              'Cómo agregar un nuevo recordatorio',
              'Para agregar un nuevo recordatorio, haga clic en el botón de agregar en la parte inferior de la pantalla y seleccione "Agregar Nuevo Recordatorio". Complete los detalles del recordatorio y guárdelo.',
            ),
            _buildHelpSection(
              'Cómo editar una tarea',
              'Para editar una tarea existente, haga clic en el ícono de editar junto a la tarea y realice los cambios necesarios.',
            ),
            _buildHelpSection(
              'Cómo eliminar una tarea',
              'Para eliminar una tarea, haga clic en el ícono de eliminar junto a la tarea que desea eliminar.',
            ),
            _buildHelpSection(
              'Cómo configurar el perfil',
              'Para configurar su perfil, vaya al menú de configuración y complete los detalles del perfil.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16.0),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(content, style: TextStyle(fontSize: 14)),
        ),
      ),
    );
  }
}
