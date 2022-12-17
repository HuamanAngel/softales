import 'package:flutter/widgets.dart';
import 'package:softales/presentation/pages/home/home_page.dart';
import 'package:softales/presentation/pages/profile/profile_page.dart';
import 'package:softales/presentation/pages/search/search_page.dart';
import 'package:softales/presentation/pages/create/create_page.dart';
import 'package:softales/presentation/pages/library/library_page.dart';
import 'package:softales/presentation/pages/auth/login/login_page.dart';
import 'package:softales/presentation/pages/auth/signup/signup_page.dart';
import 'package:softales/presentation/pages/profile/profile_page.dart';
import 'package:softales/presentation/pages/tales/tales_page.dart';
import 'package:softales/presentation/pages/tales/create_tale.dart';
import 'package:softales/presentation/pages/tales/tale_detail.dart';
import 'package:flutter/material.dart';

// abstract class AppRouter {
//   static Map<String, Widget Function(BuildContext)> pages = {
//     "login_page": (BuildContext context) => const LoginPage(),
//     // "home_page": (BuildContext context) => const HomePage(),
//     // "tales_page": (BuildContext context) => const TalesPage(),
//     "create_tale": (BuildContext context) => const CreateTale(),
//     "register_page": (BuildContext context) => const SignupPage(),
//   };
// }

class AppRouter {
  static final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    const BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
    const BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Library'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  static final List<AppPage> pages = [
    AppPage('Inicio', const HomePage(), Icons.home),
    AppPage('Buscar', const SearchPage(), Icons.search),
    AppPage('Crear', CreatePage(), Icons.create),
    AppPage('Biblioteca', const LibraryPage(), Icons.book),
    AppPage('Perfil', const ProfilePage(), Icons.person),
  ];
}

class AppPage {
  final String title;
  final Widget page;
  final IconData icon;

  AppPage(this.title, this.page, this.icon);
}
