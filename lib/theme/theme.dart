import 'package:flutter/material.dart';

// Define un tema personalizado para tu aplicación
final ThemeData customTheme = ThemeData(
  primarySwatch: Colors.blue,
  hintColor: Colors.blueAccent,
  appBarTheme: const AppBarTheme(
    color: Color(0xFFFCF7D1), // Color de la AppBar ajustado a un tono más cálido
    iconTheme: IconThemeData(
      color: Colors.blue, // Color de los íconos en la AppBar
    ),
    titleTextStyle: TextStyle(
      color: Colors.blue, // Color del texto en la AppBar
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    labelStyle: TextStyle(color: Colors.blue),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    backgroundColor: Colors.white,
  ).copyWith(
    secondary: Colors.blueAccent, // Color secundario para los elementos de la app
  ),
);
