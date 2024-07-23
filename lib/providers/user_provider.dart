import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  // Aquí puedes manejar la lógica de autenticación

  Future<void> register(String name, String email, String password) async {
    // Implementa la lógica para registrar al usuario
    // Por ejemplo, puedes hacer una llamada a una API o guardar datos localmente
    print('Registrando usuario: $name, $email');
    // Después de registrar, puedes notificar a los listeners
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    // Implementa la lógica de inicio de sesión
    print('Iniciando sesión con $email');
    // Después de iniciar sesión, puedes notificar a los listeners
    notifyListeners();
  }
}
