// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:contata_aqui/src/app.dart';

void main() {
  testWidgets('Welcome screen loads and buttons are present', (
    WidgetTester tester,
  ) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(App());

    // Verify that WelcomeScreen contains 'Login' and 'Registro' buttons.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Registro'), findsOneWidget);
  });

  testWidgets('Navigation from Welcome to Login', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    // Tap the 'Login' button
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the LoginScreen
    expect(find.text('Ir para Registro'), findsOneWidget);
  });

  testWidgets('Navigation from Welcome to Register', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(App());

    // Tap the 'Registro' button
    await tester.tap(find.text('Registro'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the RegisterScreen
    expect(find.text('Voltar para Welcome'), findsOneWidget);
  });
}
