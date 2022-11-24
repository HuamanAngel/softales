import 'package:flutter_test/flutter_test.dart';
import 'package:softales/main.dart';
import 'package:softales/presentation/pages/auth/login/login_page.dart';

void main() {
  testWidgets('App is rendered', (WidgetTester tester) async {
    await tester.pumpWidget(const Softales());
    final loginPageFinder = find.byType(LoginPage);
    expect(loginPageFinder, findsOneWidget);
  });
}
