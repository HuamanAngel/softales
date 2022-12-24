import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:softales/http/Auth.dart';
import 'package:softales/presentation/pages/auth/login/login_page.dart';
import 'package:softales/presentation/pages/auth/signup/signup_page.dart';
import 'package:softales/presentation/pages/home/home_page.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  // Pruebas de peticiones al servidor

  test("Peticion Login", () async {
    Auth auth = new Auth();
    var resp = await auth.ingresar("prueba2@gmail.com", '123bnvBNV_');

    expect(resp, '0.7gf6f6e0dda44');
  });

  test("Peticion Login - contraceña incorrecta", () async {
    Auth auth = new Auth();
    var resp = await auth.ingresar("prueba2@gmail.com", '12345bnvBNV_');

    expect(resp == 'error', true);
  });

  test("Peticion Registro existente", () async {
    Auth auth = new Auth();
    var resp = await auth.registrar(
        "santos2", "mandarina2@gmail.com", "santoschocano");

    expect(resp, 'error');
  });

  // Pruebas de widget

  group('Login y registro', () {
    late NavigatorObserver mockObserver;

    // Crear mock para navegacion
    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    Future<void> _buildWelcomePage(WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginPage(),
        navigatorObservers: [mockObserver],
        routes: {
          LoginPage.routeName: (_) => LoginPage(),
          HomePage.routeName: (_) => HomePage(),
        },
      ));
    }

    Future<void> _buildLogoutPage(WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginPage(),
        navigatorObservers: [mockObserver],
        routes: {
          LoginPage.routeName: (_) => LoginPage(),
          SignupPage.routeName: (_) => SignupPage(),
        },
      ));
    }

    testWidgets('Boton no registro - existe y redirección',
        (WidgetTester tester) async {
      await _buildLogoutPage(tester);
      final btnLogin = find.byKey(const ValueKey("btn-no-cuenta"));

      await tester.tap(btnLogin);
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
