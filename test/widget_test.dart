import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:softales/main.dart';

void main() {
  testWidgets('Check rendering', (WidgetTester tester) async {
    // Starting
    await tester.pumpWidget(const MyApp());
    expect(find.text('Vamos a empezar'), findsOneWidget);
    expect(find.text('ACCEDER'), findsOneWidget);
    await tester.tap(find.text('ACCEDER'));
    await tester.pumpAndSettle();
    // Home Page
    expect(find.text('Crear Historia'), findsOneWidget);
    expect(find.text('INICIO'), findsOneWidget);
    expect(find.text('HISTORIAS'), findsOneWidget);
    await tester.tap(find.text('HISTORIAS'));
    await tester.pumpAndSettle();
    // Tales page
    expect(find.text('Search'), findsOneWidget);
  });
}
