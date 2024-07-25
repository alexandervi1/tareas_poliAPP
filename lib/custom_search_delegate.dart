import 'package:flutter/material.dart';
import 'package:tareas_poli/models/models.dart';

class CustomSearchDelegate extends SearchDelegate<dynamic> {
  final List<Task> tasks;
  final List<Note> notes;
  final List<Reminder> reminders;

  CustomSearchDelegate({
    required this.tasks,
    required this.notes,
    required this.reminders,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context); // Muestra las sugerencias cuando se limpia la consulta
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context); // Regresa a la pantalla anterior
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _performSearch(query);
    return ListView(
      children: results.map((result) {
        return ListTile(
          title: Text(result is Task ? result.name : result is Note ? result.title : result.title),
          subtitle: Text(result is Task ? result.description : result is Note ? result.content : result.details),
          onTap: () {
            Navigator.pop(context, result); // Devuelve el resultado seleccionado
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _performSearch(query);
    return ListView(
      children: suggestions.map((suggestion) {
        return ListTile(
          title: Text(suggestion is Task ? suggestion.name : suggestion is Note ? suggestion.title : suggestion.title),
          subtitle: Text(suggestion is Task ? suggestion.description : suggestion is Note ? suggestion.content : suggestion.details),
          onTap: () {
            query = suggestion is Task ? suggestion.name : suggestion is Note ? suggestion.title : suggestion.title;
            showResults(context); // Muestra los resultados al seleccionar una sugerencia
          },
        );
      }).toList(),
    );
  }

  List<dynamic> _performSearch(String query) {
    final lowerCaseQuery = query.toLowerCase();

    // Busca en tareas
    final taskResults = tasks
        .where((task) => task.name.toLowerCase().contains(lowerCaseQuery))
        .toList();

    // Busca en notas
    final noteResults = notes
        .where((note) => note.title.toLowerCase().contains(lowerCaseQuery))
        .toList();

    // Busca en recordatorios
    final reminderResults = reminders
        .where((reminder) => reminder.title.toLowerCase().contains(lowerCaseQuery))
        .toList();

    // Combina los resultados en una sola lista
    final searchResults = <dynamic>[]
      ..addAll(taskResults)
      ..addAll(noteResults)
      ..addAll(reminderResults);

    return searchResults;
  }
}
