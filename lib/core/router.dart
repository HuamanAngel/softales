import 'package:flutter/widgets.dart';
import 'package:softales/presentation/home/collection/collection_page.dart';
import 'package:softales/presentation/home/home_page.dart';
import 'package:softales/presentation/login/login_page.dart';
import 'package:softales/presentation/tales/tales_page.dart';

abstract class AppRouter {
  static Map<String, Widget Function(BuildContext)> pages = {
    "login_page": (BuildContext context) => const LoginPage(),
    "home_page": (BuildContext context) => const HomePage(),
    "tales_page": (BuildContext context) => const TalesPage(),
    "collection_page": (BuildContext context) => const CollectionPage(),
  };
}
