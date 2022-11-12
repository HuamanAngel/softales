import 'package:flutter/material.dart';


class TaleTag extends StatelessWidget {
  final String tagText;
  const TaleTag({Key? key, required this.tagText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Text(
            tagText,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class TaleCover extends StatelessWidget {
  final String coverUrl;
  final String fallbackText;
  const TaleCover({Key? key, required this.coverUrl, required this.fallbackText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration:
      coverUrl.isNotEmpty ? BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(coverUrl),
          fit: BoxFit.cover,
        ),
      ) : null,
      child: coverUrl.isEmpty ? Container(
          color: Colors.grey,
          child: Center(child:Text(fallbackText))) : null,
    );
  }
}
