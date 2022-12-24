// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:softales/presentation/pages/home/home_page.dart';
import 'package:softales/presentation/pages/tales/create_tale.dart';

class AppRouter {
  static final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
  ];

  static final List<AppPage> pages = [
    AppPage('Inicio', const HomePage(), Icons.home),
    AppPage('Crear', const CreateTale(), Icons.create),
  ];
}

class AppPage {
  final String title;
  final Widget page;
  final IconData icon;

  AppPage(this.title, this.page, this.icon);
}
