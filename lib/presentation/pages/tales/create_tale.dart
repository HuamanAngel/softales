import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateTale extends StatefulWidget {
  const CreateTale({super.key});

  @override
  State<CreateTale> createState() => _CreateTaleState();
}

const List<String> colecciones = <String>[
  'Colección A',
  'Colección B',
  'Colección C'
];

class _CreateTaleState extends State<CreateTale> {
  String dropDownValue = colecciones.first;
  File? file;
  File? file2;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text("Si ya tienes una colección, selecciona una",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inika')),
                  const SizedBox(height: 20),
                  Container(
                      height: 100,
                      width: 370,
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: DropdownButton<String>(
                        value: dropDownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          setState(() {
                            dropDownValue = value!;
                          });
                        },
                        items: colecciones
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  const SizedBox(height: 20),
                  const Text("Datos de la Colección",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inika')),
                  const SizedBox(height: 20),
                  Container(
                    height: 180,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: file == null
                        ? const Icon(Icons.image, size: 40)
                        : Image.file(file!, fit: BoxFit.fill),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      getGalleryImageBanner();
                    },
                    color: Colors.blue.shade100,
                    padding: const EdgeInsets.all(15),
                    child: const Text('Insertar Imagen del Banner'),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 370,
                    color: Colors.white,
                    child: const TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
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
                    child: const TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Insertar Descripción',
                          contentPadding: EdgeInsets.all(10)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 370,
                    color: Colors.white,
                    child: const TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        labelText: 'Insertar Categorías separadas por coma',
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: file2 == null
                        ? const Icon(Icons.image, size: 40)
                        : Image.file(file2!, fit: BoxFit.fill),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      getGalleryImageProfile();
                    },
                    color: Colors.blue.shade100,
                    padding: const EdgeInsets.all(15),
                    child: const Text('Insertar Imagen de Portada'),
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
                      onPressed: () {},
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
        ),
      ),
    );
  }

  getGalleryImageBanner() async {
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  getGalleryImageProfile() async {
    var img2 = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file2 = File(img2!.path);
    });
  }
}
