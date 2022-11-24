import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:softales/presentation/providers/auth_provider.dart';
import 'package:softales/presentation/providers/search_provider.dart';

import 'package:softales/core/router.dart';
import 'package:softales/core/constants/app_colors.dart';
import 'package:softales/core/constants/softales_theme.dart';

import 'package:softales/presentation/main/main.dart';
import 'package:softales/presentation/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
      ChangeNotifierProvider<FocusedItemProvider>(
          create: (_) => FocusedItemProvider()),
    ],
    child: const Softales(),
  ));
}

class Softales extends StatelessWidget {
  const Softales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = SoftalesTheme.themeData;
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => AuthProvider()),
    //     ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
    //     ChangeNotifierProvider<FocusedItemProvider>(create: (_) => FocusedItemProvider(),)
    //     // Provider(create: (_) => UserProvider()),
    //     // Provider(create: (_) => ChallengeProvider()),
    //     // Provider(create: (_) => LevelProvider()),
    //   ],
    //   child: Consumer<AuthProvider>(
    //     builder: (context, state, child) {
    //       if (state.isAuthenticated) {
    //         return MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           title: 'Flutter Demo',
    //           theme: ThemeData(
    //             primarySwatch: Colors.blue,
    //           ),
    //           initialRoute: 'home_page',
    //           routes: AppRouter.pages,
    //         );
    //       } else {
    //         return const LoginPage();
    //       }
    //     },
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Softales',
      home: Consumer<AuthProvider>(
        builder: (context, state, child) {
          if (state.isAuthenticated) {
            return const Main();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
