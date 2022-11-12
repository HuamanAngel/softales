import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:softales/core/router.dart';
import 'package:softales/presentation/login/login_page.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_colors.dart';
import 'presentation/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryGreen,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // Provider(create: (_) => UserProvider()),
        // Provider(create: (_) => ChallengeProvider()),
        // Provider(create: (_) => LevelProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, state, child) {
          if (!state.isAuthenticated) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: "create_tale",
              routes: AppRouter.pages,
            );
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
