import 'package:flutter/material.dart';
import 'package:softales/presentation/providers/auth_provider.dart';
import 'package:softales/presentation/signup/signup_page.dart';
import 'package:provider/provider.dart';
import 'package:softales/presentation/widgets/input.dart';
import 'package:softales/utils/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final String? Function(String?) _validateEmail = EmailValidator().validate;
  final String? Function(String?) _validatePassword =
      PasswordValidator().validate;

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
                      ])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('¿No tienes una cuenta?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
                          child: const Text('Regístrate aquí',
                              style: TextStyle(color: Color(0xFFDD390D))))
                    ],
                  )
                ]))));
  }
}
