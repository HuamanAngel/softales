import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:softales/presentation/providers/auth_provider.dart';

class CreateTale extends StatefulWidget {
  const CreateTale({super.key});

  @override
  State<CreateTale> createState() => _CreateTaleState();
}

class _CreateTaleState extends State<CreateTale> {
  // String dropDownValue = colecciones.first;
  // File? file;
  // File? file2;
  // ImagePicker image = ImagePicker();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  Future<Tale>? _futureTale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color.fromRGBO(237, 247, 252, 1),
          appBar: AppBar(
            title: const Text('Crear Cuento'),
            centerTitle: true,
            backgroundColor: Colors.blue.shade300,
          ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: _buildForm(),
          ),
        ));
  }

  Column _buildForm() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              const Text("Datos de la Historia",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inika')),
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: 370,
                color: Colors.white,
                child: TextField(
                  controller: _controller1,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    labelText: 'Insertar Título',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 300,
                width: 360,
                color: Colors.white,
                child: TextField(
                  controller: _controller2,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Insertar Descripción',
                      contentPadding: EdgeInsets.all(10)),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 500,
                width: 360,
                color: Colors.white,
                child: TextField(
                  controller: _controller3,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Redactar contenido de la Historia',
                      contentPadding: EdgeInsets.all(10)),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.shade100,
                ),
                child: TextButton(
                  onPressed: () {
                    print('Historia Creada');
                  },
                  child: const Text(
                    'Crear',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inika',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  FutureBuilder<Tale> _buildFutureBuilder() {
    return FutureBuilder<Tale>(
      future: _futureTale,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasData) {
          return Text(snapshot.data!.description);
        } else if (snapshot.hasData) {
          return Text(snapshot.data!.content);
        } else if (snapshot.hasData) {
          return Text(snapshot.data!.colection);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  // getGalleryImageBanner() async {
  //   var img = await image.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     file = File(img!.path);
  //   });
  // }

  // getGalleryImageProfile() async {
  //   var img2 = await image.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     file2 = File(img2!.path);
  //   });
  // }
}

class Tale {
  final int id;
  final String title;
  final String description;
  final String content;
  final String colection;

  const Tale({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.colection,
  });

  factory Tale.fromJson(Map<String, dynamic> json) {
    return Tale(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      colection: json['colection'],
    );
  }
}

Future<Tale> createTale(String title, String description, String content,
    int colection, String bearer) async {
  // return http.post(
  //   Uri.parse('http://34.176.95.67/api/tale'),
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //   body: jsonEncode(<String, String>{
  //     'title': tale.title,
  //     'description': tale.description,
  //     'content': tale.content,
  //   }),
  // );
  final response = await http.post(
    Uri.parse('http://34.176.95.67/api/tale'),
    headers: <String, String>{
      HttpHeaders.authorizationHeader: 'Bearer $bearer',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'description': description,
      'content': content,
      'col_id': colection.toString(),
    }),
  );

  if (response.statusCode == 201) {
    return Tale.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error al crear la Historia.');
  }
}
