import 'package:flutter/material.dart';
import 'package:softales/domain/entities/tale.dart';
import 'package:softales/presentation/widgets/tale/tale_item.dart';
import 'package:softales/presentation/pages/tales/tale_detail.dart';

class TaleList extends StatelessWidget {
  final List<Tale> tales;
  const TaleList({Key? key, required this.tales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tales.length,
        itemBuilder: (ctx, index) {
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaleDetail(tale: tales[index]),
                        ));
                  },
                  child: TaleItem(tale: tales[index])));
        });
  }
}
