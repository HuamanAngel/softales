import 'package:flutter/material.dart';

class ReadTale extends StatelessWidget {
  final String content;
  const ReadTale({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: Text(content)));
  }
}
