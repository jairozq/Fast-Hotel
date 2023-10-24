// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fasthotel/core/helpers/password_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String goodPasswrd = "Password1";

  group('La contraseña debe tener minimo 8 caracteres', () {
    test('contraseñas con 8 caracteres son validas', () {
      final passwordHelper = PasswordHelper();
      expect(passwordHelper.hasMinimumLength(goodPasswrd), true);
    });

    test('contraseñas con menos de 8 caracteres no son validas', () {
      final passwordHelper = PasswordHelper();
      expect(passwordHelper.hasMinimumLength("123"), false);
    });
  });

  group('La contraseña debe tener minimo 1 digito', () {
    test('contraseñas con al menos 1 digito son validas', () {
      final passwordHelper = PasswordHelper();
      expect(passwordHelper.hasDigits(goodPasswrd), true);
    });

    test('contraseñas con menos de 1 digito no son validas', () {
      final passwordHelper = PasswordHelper();
      expect(passwordHelper.hasDigits("passwordd"), false);
    });
    });

  group('La contraseña debe tener minimo 1 caracter en mayuscula', () {
    test('contraseñas con al menos 1 caracter en mayuscula son validas', () {
      final passwordHelper = PasswordHelper();
      expect(passwordHelper.hasDigits(goodPasswrd), true);
    });

    test('contraseñas con menos de 1 caracter en mayuscula no son validas', () {
      final passwordHelper = PasswordHelper();
      expect(passwordHelper.hasDigits("passwordd"), false);
    });
  });
}
