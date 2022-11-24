import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Main'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(
            color: Color(0xFFDD390D),
          ),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_rounded), label: 'Library'),
            BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
