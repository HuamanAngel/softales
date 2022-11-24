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
      PasswordValidator().validate;

  void onSignup() {
    if (_signupFormKey.currentState!.validate()) {
      if (_passwordController.text == _confirmPasswordController.text) {
        print('Signup');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Las contraseñas no coinciden'),
        ));
      }
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
                      key: _signupFormKey,
                      child: Column(children: [
                        Input(
                            label: 'Email',
                            controller: _emailController,
                            validator: _validateEmail,
                            focusedBorder: _focusedBorder),
                        Input(
                          label: 'Username',
                          controller: _usernameController,
                          validator: _validateUsername,
                          focusedBorder: _focusedBorder,
                        ),
                        Input(
                            label: 'Contraseña',
                            controller: _passwordController,
                            validator: _validatePassword,
                            focusedBorder: _focusedBorder,
                            isPassword: true),
                        Input(
                            label: 'Confirmar contraseña',
                            controller: _confirmPasswordController,
                            validator: _validatePassword,
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
                ]))));
  }

  // @override
  // Widget build(BuildContext context) {
  //   final TextEditingController _pass = TextEditingController();
  //   final TextEditingController _confirmPass = TextEditingController();
  //   return Scaffold(
  //       backgroundColor: const Color.fromRGBO(245, 245, 252, 1.0),
  //       body: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             SizedBox(height: 80),
  //             const Center(
  //               child: Text(
  //                 '¡Registrese!',
  //                 style: TextStyle(fontFamily: 'Inder', fontSize: 30),
  //               ),
  //             ),
  //             SizedBox(height: 80),
  //             Column(
  //               children: [
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
  //                   child: Form(
  //                     autovalidateMode: AutovalidateMode.onUserInteraction,
  //                     child: Column(
  //                       children: [
  //                         Container(
  //                           padding: EdgeInsets.symmetric(horizontal: 15),
  //                           decoration: box_decoration(),
  //                           child: TextFormField(
  //                             decoration: input_decoration('Nombres'),
  //                             validator: name_validator,
  //                           ),
  //                         ),
  //                         SizedBox(height: 17),
  //                         Container(
  //                           padding: EdgeInsets.symmetric(horizontal: 15),
  //                           decoration: box_decoration(),
  //                           child: TextFormField(
  //                             decoration: input_decoration('Apellidos'),
  //                             validator: name_validator,
  //                           ),
  //                         ),
  //                         SizedBox(height: 17),
  //                         Container(
  //                           padding: EdgeInsets.symmetric(horizontal: 15),
  //                           decoration: box_decoration(),
  //                           child: TextFormField(
  //                             keyboardType: TextInputType.emailAddress,
  //                             decoration:
  //                                 input_decoration('Correo Electronico'),
  //                             validator: (value) {
  //                               String pattern =
  //                                   r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //                               RegExp regExp = new RegExp(pattern);
  //                               return regExp.hasMatch(value ?? '')
  //                                   ? null
  //                                   : 'El valor ingresado no es un correo';
  //                             },
  //                           ),
  //                         ),
  //                         SizedBox(height: 17),
  //                         Container(
  //                           padding: EdgeInsets.symmetric(horizontal: 15),
  //                           decoration: box_decoration(),
  //                           child: TextFormField(
  //                             decoration: input_decoration('Contraseña'),
  //                             controller: _pass,
  //                             obscureText: true,
  //                             validator: (value) {
  //                               return (value != null &&
  //                                       value.trim().length >= 5)
  //                                   ? null
  //                                   : 'La clave debe ser al menos 5 caracteres';
  //                             },
  //                           ),
  //                         ),
  //                         SizedBox(height: 17),
  //                         Container(
  //                           padding: EdgeInsets.symmetric(horizontal: 15),
  //                           decoration: box_decoration(),
  //                           child: TextFormField(
  //                             decoration:
  //                                 input_decoration('Confirmar contraseña'),
  //                             controller: _confirmPass,
  //                             obscureText: true,
  //                             validator: (value) {
  //                               return (value != null &&
  //                                       value.trim() == _pass.text.trim())
  //                                   ? null
  //                                   : 'La contraseña no coincide';
  //                             },
  //                           ),
  //                         ),
  //                         SizedBox(height: 27),
  //                         MaterialButton(
  //                             shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(23)),
  //                             color: Colors.green[900],
  //                             child: Container(
  //                               padding: EdgeInsets.symmetric(
  //                                   horizontal: 65, vertical: 15),
  //                               child: Text(
  //                                 'Registrarme',
  //                                 style: TextStyle(
  //                                     color: Colors.white,
  //                                     fontFamily: 'Inder',
  //                                     fontSize: 16),
  //                               ),
  //                             ),
  //                             onPressed: () {
  //                               Navigator.push(
  //                                   context,
  //                                   MaterialPageRoute(
  //                                       builder: (context) =>
  //                                           const LoginPage()));
  //                             })
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 Container(
  //                   child: Center(
  //                       child: Container(
  //                     padding: EdgeInsets.symmetric(vertical: 25),
  //                     child: Text('¿Ya tienes una cuenta?',
  //                         style: TextStyle(
  //                             fontFamily: 'Inder',
  //                             fontSize: 14,
  //                             color: Colors.blueAccent)),
  //                   )),
  //                 ),
  //                 Image.asset("assets/images/Logo.png")
  //               ],
  //             ),
  //           ],
  //         ),
  //       ));
  // }

  // String? name_validator(value) {
  //   String patternletters = r'^[a-z A-Z]+$';
  //   RegExp regExp = new RegExp(patternletters);
  //   if (value != null && !regExp.hasMatch(value.trim())) {
  //     return 'Debe contener solo letras';
  //   }
  //   if (value != null && value.trim().length < 5) {
  //     return 'Debe ser mayor a 5 caracteres';
  //   } else if (value != null && value.trim().length > 30) {
  //     return 'Debe ser menor a 30 caracteres';
  //   } else {
  //     return null;
  //   }
  // }

  // BoxDecoration box_decoration() {
  //   return BoxDecoration(
  //       color: Colors.white, borderRadius: BorderRadius.circular(10));
  // }

  // InputDecoration input_decoration(String hinttext) {
  //   return InputDecoration(
  //       border: InputBorder.none,
  //       hintText: hinttext,
  //       hintStyle: TextStyle(
  //           fontFamily: 'Inder', color: Color.fromRGBO(0, 118, 135, 0.3)));
  // }
}
