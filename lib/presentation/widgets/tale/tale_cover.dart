import 'package:flutter/material.dart';

class TaleCover extends StatelessWidget {
  final String url;
  final String fallbackText;
  const TaleCover({Key? key, required this.url, required this.fallbackText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      width: 512,
      child: url.isNotEmpty
          ? Image.network(
              url,
              fit: BoxFit.contain,
            )
          : Center(
              child: Text(
                fallbackText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
