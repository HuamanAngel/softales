import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:softales/main.dart';
import 'package:softales/presentation/pages/auth/login/login_page.dart';
import 'package:softales/utils/validators.dart';
import 'package:softales/http/Auth.dart';

void main() {
  testWidgets('App is rendered', (WidgetTester tester) async {
    await tester.pumpWidget(const Softales());
    final loginPageFinder = find.byType(LoginPage);
    expect(loginPageFinder, findsOneWidget);
  });

  // testWidgets('Login is validated correctly', (WidgetTester tester) async {
  //   await tester.pumpWidget(const Softales());
  //   final loginPageFinder = find.byType(LoginPage);
  //   expect(loginPageFinder, findsOneWidget);
  // });

  // test("Peticion Login", () async {
  //   Auth auth = Auth();
  //   var resp = await auth.ingresar("bnv@gmail.com", "123bnvBNV${''}");
  //   expect(resp != 'error', true);
  // });

  // test("Peticion Registro", () async {
  //   Auth auth = Auth();
  //   var resp =
  //       await auth.registrar("Hello", "bnv2@gmail.com", "123bnvBNV${''}");
  //   expect(resp, 'ok');
  // });
}
