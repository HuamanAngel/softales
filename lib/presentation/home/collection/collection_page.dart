import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green.shade300),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(20)),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontSize: 20)),
                ),
                child: const Text("Crear Historia"),
              ),
            ],
          ),
          Image(
            image: const AssetImage("assets/images/Logo.png"),
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Image(
            image: const AssetImage("assets/images/Logo.png"),
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Image(
            image: const AssetImage("assets/images/Logo.png"),
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Image(
            image: const AssetImage("assets/images/Logo.png"),
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Image(
            image: const AssetImage("assets/images/Logo.png"),
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Image(
            image: const AssetImage("assets/images/Logo.png"),
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Image(
            image: const AssetImage("assets/images/Logo.png"),
            width: MediaQuery.of(context).size.width * 0.1,
          ),
        ]));
  }
}
