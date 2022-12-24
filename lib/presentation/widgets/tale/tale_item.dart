import 'package:flutter/material.dart';
import 'package:softales/domain/entities/tale.dart';
import 'package:softales/presentation/widgets/tale/tale_cover.dart';

class TaleItem extends StatelessWidget {
  final Tale tale;

  const TaleItem({Key? key, required this.tale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Row(children: [
          SizedBox(
              width: 128,
              child:
                  TaleCover(url: tale.coverImageUrl, fallbackText: tale.title)),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: 20,
                        child: Text(tale.title,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        child: RichText(
                          text: TextSpan(
                            text: tale.description,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.black),
                          ),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )))
        ]));
  }
}
