import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _studentCode = '';
  int _semester = 1;
  String _email = '';
  String _faculty = 'FADE';

  // Getters
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get studentCode => _studentCode;
  int get semester => _semester;
  String get email => _email;
  String get faculty => _faculty;

  // Setters
  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void setStudentCode(String studentCode) {
    _studentCode = studentCode;
    notifyListeners();
  }

  void setSemester(int semester) {
    _semester = semester;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setFaculty(String faculty) {
    _faculty = faculty;
    notifyListeners();
  }

  // Método para actualizar todo el perfil
  void updateProfile({
    required String firstName,
    required String lastName,
    required String studentCode,
    required int semester,
    required String email,
    required String faculty,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _studentCode = studentCode;
    _semester = semester;
    _email = email;
    _faculty = faculty;
    notifyListeners();
  }
}
