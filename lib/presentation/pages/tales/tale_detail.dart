import 'package:flutter/material.dart';
import 'package:softales/domain/entities/tale.dart';
import 'package:softales/presentation/widgets/tale/tale_cover.dart';
import 'package:softales/utils/date.dart';
import 'package:softales/presentation/pages/tales/read_tale.dart';

class TaleDetail extends StatelessWidget {
  final Tale tale;

  const TaleDetail({Key? key, required this.tale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              // margin: const EdgeInsets.symmetric(vertical: 20),
              height: 200,
              child: SizedBox(
                  width: 128,
                  child: TaleCover(
                      url: tale.coverImageUrl, fallbackText: tale.title)),
            ),
            const SizedBox(height: 20),
            Text(tale.title, style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 10),
            Text(tale.authorId, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            // Read and save button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReadTale(tale: tale)))
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text("Leer"),
                  ),
                  const SizedBox(width: 20),
                ]),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text('Publicado el: ${formatDate(tale.createdAt)}',
                        style: const TextStyle(fontSize: 15)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                        'Actualizado por última vez el: ${formatDate(tale.lastUpdatedAt)}',
                        style: const TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:
                  Text(tale.description!, style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20),
          ],
        )));
  }
}
