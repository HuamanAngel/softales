import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 252, 1.0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                //decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Text(
                    '¡Registrese!',
                    style: TextStyle(fontFamily: 'Inder', fontSize: 30),
                  ),
                ),
              ),
              SizedBox(height: 80),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    child: Form(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Nombres y apellidos',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Inder',
                                      color: Color.fromRGBO(0, 118, 135, 0.3))),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(),
                          SizedBox(height: 20),
                          TextFormField(),
                          SizedBox(height: 20),
                          TextFormField(),
                          SizedBox(height: 20),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: Colors.green[900],
                              onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                        child: Text('¿Ya tienes una cuenta?',
                            style: TextStyle(
                                fontFamily: 'Inder',
                                fontSize: 14,
                                color: Colors.blueAccent))),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
