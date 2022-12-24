import 'package:flutter/material.dart';
import 'package:softales/models/Usuario.dart';

class AuthProvider extends ChangeNotifier {
  Usuario _user = const Usuario(
    ok: false,
    uid: '',
    username: '',
    token: '',
    email: '',
  );
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;
  Usuario get user => _user;

  void login(data) {
    _isAuthenticated = true;
    _user = Usuario.fromJson(data);
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
