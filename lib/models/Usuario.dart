import 'dart:io';
import 'package:equatable/equatable.dart';

class Usuario extends Equatable{
  final bool ok;
  final String uid;
  final String nombre;
  final String token;

  const Usuario({
    required this.ok,
    required this.uid,
    required this.nombre,
    required this.token,
  });

  @override
  List<Object> get props => [
    ok,
    uid,
    nombre,
    token,
  ];

  String get gUid => uid;
  String get gNombre => nombre;
  String get gToken => token;

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      ok: json['ok'],
      nombre: json['nombre'],
      uid: json['uid'],
      token: json['token'],
    );
  }
}