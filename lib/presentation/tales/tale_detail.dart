import 'package:flutter/material.dart';
import 'package:softales/data/tale_data.dart';
import 'package:softales/presentation/widgets/softales-ui.dart';

class TaleDetail extends StatelessWidget {
  final TaleData tale;

  const TaleDetail({Key? key, required this.tale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child:Center(
              child: TaleCover(
                coverUrl: tale.image,
                fallbackText: tale.title,
              ),
            ), ),
          const SizedBox(height: 20),
          Text(tale.title, style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 10),
          Text(tale.author, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(height: 50, width: 125, child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tale.tags.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TaleTag(tagText: tale.tags[index]),
                  );
                },
              ) ,)
          ),
          const SizedBox(height: 20),
          // Read and save button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () => {}, child: const Text("Read"),),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () => {}, child: const Text("Save")),
                ]
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text('Published date: ${tale.publishedDate}', style: const TextStyle(fontSize: 15)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text('Last updated: ${tale.lastUpdatedDate}', style: const TextStyle(fontSize: 15)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.remove_red_eye_rounded),
                        const SizedBox(width: 10),
                        Text('${tale.readCount}', style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.favorite_border_rounded),
                        const SizedBox(width: 10),
                        Text('${tale.readCount}', style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                ],
              )
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(tale.description, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 20),
        ],
      ))

    );
  }
}
