import 'package:flutter/material.dart';
import 'package:softales/presentation/providers/auth_provider.dart';
import 'package:softales/presentation/widgets/custom_appbar.dart';
import 'package:softales/presentation/login/register_page.dart';
import 'package:provider/provider.dart';
import './widgets/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordObscure = true;

  // email validator
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu correo';
    }
    String emailPattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    if (!RegExp(emailPattern).hasMatch(value)) {
      return 'Por favor ingresa un correo válido';
    }
    return null;
  }

  // password validator
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu contraseña';
    }
    String passwordPattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$_\.]).{8,}$';
    if (!RegExp(passwordPattern).hasMatch(value)) {
      return 'La contraseña debe tener al menos 8 caracteres,\nuna letra mayúscula, una minúscula, un número\ny uno de los siguientes carácteres especiales:  #\$_.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  SizedBox(
                      height: 72.0,
                      child: Image.asset(
                        'assets/images/logo_full.png',
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(height: 40),
                  Form(
                      key: _loginFormKey,
                      child: Column(children: [
                        Input(
                            label: 'Email',
                            controller: _emailController,
                            validator: _validateEmail,
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFDD390D)),
                            )),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Input(
                            label: 'Contraseña',
                            controller: _passwordController,
                            validator: _validatePassword,
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFDD390D)),
                            ),
                            isPassword: true),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_loginFormKey.currentState!
                                        .validate()) {
                                      context.read<AuthProvider>().login();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFDD390D),
                                  ),
                                  child: const Text('Login')),
                            )),
                        const SizedBox(
                          height: 80.0,
                        ),
                      ]))
                ]))));
  }
}
