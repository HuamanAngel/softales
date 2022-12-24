import 'dart:io';
import 'package:equatable/equatable.dart';

class Usuario extends Equatable{
  final bool ok;
  final String uid;
  final String username;
  final String token;
  final String email;

  const Usuario({
    required this.ok,
    required this.uid,
    required this.username,
    required this.token,
    required this.email
  });

  @override
  List<Object> get props => [
    ok,
    uid,
    username,
    email,
    token,
  ];

  String get gUid => uid;
  String get gUsername => username;
  String get gToken => token;

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      ok: json['ok'],
      username: json['username'],
      email: json['email'],
      uid: json['id'],
      token: json['token'],
    );
  }
}