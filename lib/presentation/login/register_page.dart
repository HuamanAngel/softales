import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 252, 1.0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              const Center(
                child: Text(
                  '¡Registrese!',
                  style: TextStyle(fontFamily: 'Inder', fontSize: 30),
                ),
              ),
              SizedBox(height: 80),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: box_decoration(),
                            child: TextFormField(
                              decoration: input_decoration('Nombres'),
                              validator: name_validator,
                            ),
                          ),
                          SizedBox(height: 17),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: box_decoration(),
                            child: TextFormField(
                              decoration: input_decoration('Apellidos'),
                              validator: name_validator,
                            ),
                          ),
                          SizedBox(height: 17),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: box_decoration(),
                            child: TextFormField(
                              decoration:
                                  input_decoration('Correo Electronico'),
                              validator: (value) {
                                String pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regExp = new RegExp(pattern);
                                return regExp.hasMatch(value ?? '')
                                    ? null
                                    : 'El valor ingresado no es un correo';
                              },
                            ),
                          ),
                          SizedBox(height: 17),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: box_decoration(),
                            child: TextFormField(
                              decoration: input_decoration('Contraseña'),
                            ),
                          ),
                          SizedBox(height: 17),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: box_decoration(),
                            child: TextFormField(
                              decoration:
                                  input_decoration('Confirmar contraseña'),
                            ),
                          ),
                          SizedBox(height: 27),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23)),
                              color: Colors.green[900],
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 65, vertical: 15),
                                child: Text(
                                  'Registrarme',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inder',
                                      fontSize: 16),
                                ),
                              ),
                              onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                        child: Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text('¿Ya tienes una cuenta?',
                          style: TextStyle(
                              fontFamily: 'Inder',
                              fontSize: 14,
                              color: Colors.blueAccent)),
                    )),
                  ),
                  Image.asset("assets/images/Logo.png")
                ],
              ),
            ],
          ),
        ));
  }

  String? name_validator(value) {
    String patternletters = r'^[a-zA-Z]+$';
    RegExp regExp = new RegExp(patternletters);
    if (value != null && !regExp.hasMatch(value.trim())) {
      return 'Debe contener solo letras';
    }
    if (value != null && value.trim().length < 5) {
      return 'Debe ser mayor a 5 caracteres';
    } else if (value != null && value.trim().length > 30) {
      return 'Debe ser menor a 30 caracteres';
    } else {
      return null;
    }
  }

  BoxDecoration box_decoration() {
    return BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10));
  }

  InputDecoration input_decoration(String hinttext) {
    return InputDecoration(
        border: InputBorder.none,
        hintText: hinttext,
        hintStyle: TextStyle(
            fontFamily: 'Inder', color: Color.fromRGBO(0, 118, 135, 0.3)));
  }
}
