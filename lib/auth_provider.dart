// lib/auth_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {

  bool _isLoggedIn = false;
  String _userName = '';
  String _token = '';

  bool get isLoggedIn => _isLoggedIn;
  String get userName => _userName;
  String get token => _token;

  Future<void> cargarSesion() async {

    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token');
    final username = prefs.getString('username');

    print("TOKEN RECUPERADO: $token");
    print("USERNAME RECUPERADO: $username");

    if (token != null) {

      _token = token;
      _userName = username ?? '';
      _isLoggedIn = true;

      notifyListeners();

    }

  }

  void login(String name, String token) {
    _isLoggedIn = true;
    _userName = name;
    _token = token;
    notifyListeners();
  }

  Future<void> logout() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
    await prefs.remove('username');

    _isLoggedIn = false;
    _userName = '';
    _token = '';

    notifyListeners();
  }
}