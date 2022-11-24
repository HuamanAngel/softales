import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:softales/presentation/providers/auth_provider.dart';
import 'package:softales/presentation/providers/search_provider.dart';

import 'package:softales/core/router.dart';
import 'package:softales/core/constants/app_colors.dart';
import 'package:softales/core/constants/softales_theme.dart';

import 'package:softales/presentation/pages/auth/login/login_page.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Softales',
      // home: Consumer<AuthProvider>(
      //   builder: (context, state, child) {
      //     if (state.isAuthenticated) {
      //       return const App();
      //     } else {
      //       return const LoginPage();
      //     }
      //   },
      // ),
      home: ChangeNotifierProvider<AuthProvider>(
        create: ((context) => AuthProvider()),
        child: Consumer<AuthProvider>(
          builder: (context, state, child) {
            if (state.isAuthenticated) {
              return const App();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    const BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
    const BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Library'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Hola'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: _currentIndex,
        items: _items,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
          color: Color(0xFFDD390D),
        ),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        onTap: (value) => setState(() => _currentIndex = value),
      ),
    );
  }
}
