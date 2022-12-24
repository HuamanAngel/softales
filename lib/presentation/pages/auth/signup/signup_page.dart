import 'package:flutter/material.dart';

import 'package:softales/presentation/pages/auth/login/login_page.dart';
import 'package:softales/presentation/widgets/input.dart';

import 'package:provider/provider.dart';
import 'package:softales/presentation/providers/auth_provider.dart';

import 'package:softales/utils/validators.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _signupFormKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final String? Function(String?) _validateEmail = EmailValidator().validate;
  final String? Function(String?) _validateUsername =
      UsernameValidator().validate;
  final String? Function(String?) _validatePassword =
      PasswordValidator().validateSignup;

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void onSignup() {
    if (_signupFormKey.currentState!.validate()) {
      print('Hello');
    }
  }

  final InputBorder _focusedBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFDD390D)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                    SizedBox(
                        height: 72.0,
                        child: Image.asset(
                          'assets/images/logo_full.png',
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 40),
                    Form(
                        key: _signupFormKey,
                        child: Column(children: [
                          Input(
                              label: 'Email',
                              controller: _emailController,
                              validator: _validateEmail,
                              focusedBorder: _focusedBorder),
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(UsernameValidator.rule,
                                      style: TextStyle(fontSize: 12)))),
                          Input(
                            label: 'Username',
                            controller: _usernameController,
                            validator: _validateUsername,
                            focusedBorder: _focusedBorder,
                          ),
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(PasswordValidator.rule,
                                      style: TextStyle(fontSize: 12)))),
                          Input(
                              label: 'Contraseña',
                              controller: _passwordController,
                              validator: _validatePassword,
                              focusedBorder: _focusedBorder,
                              isPassword: true),
                          Input(
                              label: 'Confirmar contraseña',
                              controller: _confirmPasswordController,
                              validator: _validateConfirmPassword,
                              focusedBorder: _focusedBorder,
                              isPassword: true),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: onSignup,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFDD390D),
                                    ),
                                    child: const Text('Registrar')),
                              )),
                        ])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('¿Ya tienes una cuenta?'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text('Ingresa aquí',
                                style: TextStyle(color: Color(0xFFDD390D))))
                      ],
                    )
                  ])),
            )));
  }
}
