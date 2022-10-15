import 'package:flutter/material.dart';
import 'package:softales/presentation/providers/auth_provider.dart';
import 'package:softales/presentation/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                        const SizedBox(
                          height: 150.0,
                          width: 200.0,
                          child: Text(
                            'Vamos a empezar',
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(7),
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(7),
                          child: const TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                suffixIcon: Icon(Icons.remove_red_eye_rounded),
                                hintText: 'Password',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            AuthProvider authProvider =
                                (Provider.of<AuthProvider>(context,
                                    listen: false));
                            authProvider.login();
                          },
                          minWidth: 600.0,
                          height: 50.0,
                          color: const Color(0xFF007DBC),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'ACCEDER',
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
