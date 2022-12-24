import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Usuario.dart';

class Auth {

  Future<String> registrar(String correo, String password) async {
    var response = await http.post(
      Uri.parse('http://localhost:4000/api/auth/new'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': 'Brandom Prueba',
        'apellido': 'PruebaNV',
        'email': correo,
        'movil': "123456789",
        'password': password
      }),
    );
    if (response.statusCode == 201){
      return 'ok';
    } else {
      return 'a';
    }
  }

  Future<String> ingresar(String email, String password) async {

    var response = await http.post(
      Uri.parse('http://localhost:4000/api/auth/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 400){
      return 'a';
    } else {
      Usuario usr = Usuario.fromJson(jsonDecode(response.body));
      return usr.gUid;
    }
  }

}
