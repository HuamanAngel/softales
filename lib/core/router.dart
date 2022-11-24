import 'package:flutter/widgets.dart';
import 'package:softales/presentation/pages/home/home_page.dart';
import 'package:softales/presentation/pages/auth/login/login_page.dart';
import 'package:softales/presentation/pages/auth/signup/signup_page.dart';
import 'package:softales/presentation/pages/tales/tales_page.dart';
import 'package:softales/presentation/pages/tales/create_tale.dart';
import 'package:softales/presentation/pages/tales/tale_detail.dart';

abstract class AppRouter {
  static Map<String, Widget Function(BuildContext)> pages = {
    "login_page": (BuildContext context) => const LoginPage(),
    // "home_page": (BuildContext context) => const HomePage(),
    // "tales_page": (BuildContext context) => const TalesPage(),
    "create_tale": (BuildContext context) => const CreateTale(),
    "register_page": (BuildContext context) => const SignupPage(),
  };
}
