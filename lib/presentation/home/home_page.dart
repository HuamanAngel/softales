import 'package:flutter/material.dart';
import 'package:softales/presentation/home/collection/collection_page.dart';
import 'package:softales/presentation/tales/tales_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Image.asset("assets/images/Logo.png",
                width: MediaQuery.of(context).size.width * 0.1),
            backgroundColor: Colors.blue.shade500,
            actions: <Widget>[
              InkWell(
                child: Container(
                  margin: const EdgeInsets.only(right: 1),
                  child: Image.asset("assets/images/profile-circle.png",
                      width: MediaQuery.of(context).size.width * 0.1),
                ),
                onTap: () {},
              ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: Image.asset("assets/images/Logout.png",
                      width: MediaQuery.of(context).size.width * 0.1),
                ),
                onTap: () {},
              ),
            ],
            bottom: TabBar(tabs: <Widget>[
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.home),
                    Text(
                      "INICIO",
                      style: (TextStyle(fontFamily: 'Inika')),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.book),
                    Text(
                      "HISTORIAS",
                      style: (TextStyle(fontFamily: 'Inika')),
                    ),
                  ],
                ),
              ),
            ])),
        body: const TabBarView(
          children: <Widget>[CollectionPage(), TalesPage()],
        ),
      ),
    );
  }
}
