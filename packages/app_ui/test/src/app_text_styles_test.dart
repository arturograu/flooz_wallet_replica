import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTextStyle', () {
    test('heading3 returns TextStyle', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppTextStyle.heading3, isA<TextStyle>());
    });

    test('heading5 returns TextStyle', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppTextStyle.heading5, isA<TextStyle>());
    });

    test('l returns TextStyle', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppTextStyle.l, isA<TextStyle>());
    });

    test('xl returns TextStyle', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppTextStyle.xl, isA<TextStyle>());
    });
  });
}
