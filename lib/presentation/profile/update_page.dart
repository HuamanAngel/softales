import 'package:flutter/material.dart';
import 'package:softales/presentation/providers/auth_provider.dart';
import 'package:softales/presentation/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';


class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: customAppBar(context),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                        ),
                        const SizedBox(
                          child: Text(
                            'Editar Credenciales',
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                        ),
                        Container(
                          margin: const EdgeInsets.all(7),
                          child: const TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_box_outlined),
                                hintText: 'Username',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                        ),
                        Container(
                          margin: const EdgeInsets.all(7),
                          child: const TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Email',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                        ),
                        Container(
                          margin: const EdgeInsets.all(7),
                          child: const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              hintText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                        ),
                        Container(
                          margin: const EdgeInsets.all(7),
                          child: const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                hintText: 'Repeat Password',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                        ),
                        MaterialButton(
                          onPressed: () {
                          },
                          minWidth: 760.0,
                          height: 60.0,
                          color: const Color(0xFF007DBC),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'ACEPTAR CAMBIOS',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
