import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Image.asset("assets/LogoHeader.png",
                width: MediaQuery.of(context).size.width * 0.4),
            backgroundColor: Colors.blue.shade500,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.star),
                color: Colors.yellow,
                tooltip: 'Trofeos',
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.lens_rounded),
                color: Colors.red,
                tooltip: 'Usuario',
                onPressed: () {},
              ),
            ],
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.gps_fixed_outlined),
                text: 'Desafios',
              ),
              Tab(
                icon: Icon(Icons.workspace_premium_outlined),
                text: 'Logros',
              ),
            ])),
        body: const TabBarView(
          children: <Widget>[
            // ChallengesPage(), RewardsPage()
          ],
        ),
      ),
    );
  }
}
