import 'package:flutter/material.dart';

class TalesPage extends StatefulWidget {
  const TalesPage({super.key});

  @override
  State<TalesPage> createState() => _TalesPageState();
}

class _TalesPageState extends State<TalesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("All tales"),
    );
  }
}
