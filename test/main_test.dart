import 'package:flutter_test/flutter_test.dart';
import 'package:softales/http/Auth.dart';
import 'package:softales/main.dart';
import 'package:softales/presentation/pages/auth/login/login_page.dart';

void main() {
  testWidgets('App is rendered', (WidgetTester tester) async {
    await tester.pumpWidget(const Softales());
    final loginPageFinder = find.byType(LoginPage);
    expect(loginPageFinder, findsOneWidget);
  });



  test("Peticion Login", () async{
    Auth auth = new Auth();
    var resp = await auth.ingresar("bnv@gmail.com", "123bnvBNV$");
    
    expect(resp is String, true);
  });

  test("Peticion Registro", () async{
    Auth auth = new Auth();
    var resp = await auth.registrar("bnv2@gmail.com", "123bnvBNV$");

    expect(resp, 'ok');
  });


}
