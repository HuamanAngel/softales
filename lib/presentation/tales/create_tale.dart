import 'dart:io';

import 'package:flutter/material.dart';
import 'package:softales/presentation/widgets/custom_appbar.dart';
import 'package:image_picker/image_picker.dart';

class CreateTale extends StatefulWidget {
  const CreateTale({super.key});

  @override
  State<CreateTale> createState() => _CreateTaleState();
}

List<File> myFile = [];
ImagePicker? picker;

class _CreateTaleState extends State<CreateTale> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      const Text("Datos de la Colección",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inika')),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          var file = await picker?.pickImage(
                              source: ImageSource.gallery);

                          setState(() {
                            myFile.add(File(file!.path));
                          });
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.only(
                                  top: 50, bottom: 50, left: 90, right: 90)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFE5E5E5)),
                        ),
                        child: const Text("Insertar imagen del Banner",
                            style: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Título de la Colección',
                          prefixIcon: Icon(Icons.title),
                          hoverColor: Color(0xFFE5E5E5),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Descripción de la Colección',
                          prefixIcon: Icon(Icons.description),
                          hoverColor: Color(0xFFE5E5E5),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Categorías de la Colección',
                          prefixIcon: Icon(Icons.category),
                          hoverColor: Color(0xFFE5E5E5),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          var file = await picker?.pickImage(
                              source: ImageSource.gallery);

                          setState(() {
                            myFile.add(File(file!.path));
                          });
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.only(
                                  top: 40, bottom: 40, left: 20, right: 20)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFE5E5E5)),
                        ),
                        child: const Text("Insertar imagen de la Colección",
                            style: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(height: 10),
                      DropdownButton(
                        hint: const Text("Selecciona una Colección"),
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Colección A"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Colección B"),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text("Colección C"),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
