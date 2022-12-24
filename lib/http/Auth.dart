import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Usuario.dart';

class Auth {
  Future<String> registrar(
      String username, String correo, String password) async {
    var response = await http.post(
      Uri.parse('http://34.176.95.67/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': correo,
        'password': password
      }),
    );
    if (response.statusCode == 201) {
      return 'ok';
    } else {
      return 'error';
    }
  }

  Future<String> ingresar(String email, String password) async {
    var response = await http.post(
      Uri.parse('http://34.176.95.67/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 400) {
      return 'error';
    } else {
      Usuario usr = Usuario.fromJson(jsonDecode(response.body));
      return usr.gUid;
    }
  }
}
