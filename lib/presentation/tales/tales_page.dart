import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softales/presentation/providers/search_provider.dart';
import 'package:softales/data/tale_data.dart';
import 'package:softales/presentation/tales/tale_detail.dart';
import 'package:softales/presentation/widgets/softales-ui.dart';

class TalesPage extends StatefulWidget {
  const TalesPage({Key? key}) : super(key: key);

  @override
  State<TalesPage> createState() => _TalesPageState();
}

class _TalesPageState extends State<TalesPage> {
  @override
  Widget build(BuildContext context) {
    SearchProvider watchSearch = context.watch<SearchProvider>();
    FocusedItemProvider watchFocusedItem = context.watch<FocusedItemProvider>();
    return Scaffold(
      body: Column(
        children: [
          const Searchbar(),
          Expanded(
              child: ListView.builder(
              itemCount: DUMMY_TALES.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: VerticalItem(data: DUMMY_TALES[index]),
                    onTap: () {
                      watchFocusedItem.setFocusedItem(DUMMY_TALES[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaleDetail(tale: DUMMY_TALES[index]),
                        ),
                      );
                    },
                  ));
              })
          )
        ]
      )
    );
  }
}

class Searchbar extends StatelessWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
              ),
              onChanged: (value) {
                context.read<SearchProvider>().setSearchText(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class HorizontalList extends StatefulWidget {
//   const HorizontalList({Key? key}) : super(key: key);
//
//   @override
//   State<HorizontalList> createState() => _HorizontalListState();
// }

// class _HorizontalListState extends State<HorizontalList> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: Text(
//               "Tales Category",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 120,
//             width: MediaQuery.of(context).size.width,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: DUMMY_TALES.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height,
//                     width: 50,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ]
//       )
//     );
//   }
// }




class VerticalItem extends StatelessWidget {
  final TaleData data;
  const VerticalItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // horizontal list item
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TaleCover(coverUrl: data.image, fallbackText: data.title,),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title),
                  Text(data.author),
                  const SizedBox(height: 10),
                  Expanded(child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: data.tags.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TaleTag(tagText: data.tags[index]),
                      );
                    },
                  )),
                  SizedBox(height: 10,),
                  Text(data.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}

