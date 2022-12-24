import 'package:flutter/material.dart';
import 'package:softales/domain/entities/tale.dart';

class ReadTale extends StatelessWidget {
  final Tale tale;
  const ReadTale({Key? key, required this.tale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: SizedBox(
                child: Text(tale.title,
                    style: const TextStyle(
                      color: Colors.black,
                    )))),
        body: Center(child: Text(tale.content)));
  }
}
