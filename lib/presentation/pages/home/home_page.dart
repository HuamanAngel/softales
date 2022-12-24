import 'package:flutter/material.dart';
import 'package:softales/domain/entities/tale.dart';
import 'package:softales/presentation/widgets/tale/tale_list.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://34.176.95.67/api/collection';

  Future<List<Tale>> _getTales() async {
    List<Tale> tales = [];
    final Response res = await Dio().get(url);
    for (final e in res.data[0]) {
      Tale tale = Tale.fromJson(e);
      tales.add(tale);
    }
    return tales;
  }

  // void fetchTales() async {
  //   var url = 'http://34.176.95.67/api/collection';
  //   try {
  //     Response response = await Dio().get(url);
  //     List<Tale> responseFormatted = response.data[0]
  //         .map<Widget>((e) => Tale(
  //               id: e['id'].toString(),
  //               title: e['col_titl'],
  //               description: e['col_desc'],
  //               coverImageUrl: e['col_fron_img'],
  //               category: e['col_cate'],
  //               authorId: e['user_id'],
  //               createdAt: DateTime.parse(e['created_at']),
  //               lastUpdatedAt: DateTime.parse(e['updated_at']),
  //             ))
  //         .toList();
  //     tales = responseFormatted;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // fetchTales();
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
