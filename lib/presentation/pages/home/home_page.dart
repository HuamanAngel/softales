import 'package:flutter/material.dart';
import 'package:softales/domain/entities/tale.dart';
import 'package:softales/presentation/widgets/tale/tale_list.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  static const routeName = "home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://34.176.95.67/api/tale';

  Future<List<Tale>> _getTales() async {
    List<Tale> tales = [];
    final Response res = await Dio().get(url);
    for (final e in res.data[0]) {
      Tale tale = Tale.fromJson(e);
      tales.add(tale);
    }
    return tales.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: _getTales(),
            builder: (context, AsyncSnapshot<List<Tale>> snapshot) {
              if (snapshot.hasData) {
                return TaleList(tales: snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )
      ],
    );
  }
}
