import 'package:flutter/material.dart';

/// Color palette for the App UI Kit.
abstract class AppColors {
  /// The primary color.
  static const Color primary = Color(0xFF5E38F4);

  /// The Neutral/950 color.
  static const Color neutral950 = Color(0xFF09080A);

  /// The Neutral/90 color.
  static const Color neutral90 = Color(0xFF0F0F0F);

  /// The neutral color and swatch.
  static const MaterialColor neutral = MaterialColor(0xFF0F0F0F, {
    200: Color(0xFFF2F2F5),
    500: Color(0xFF8A8A99),
    700: Color(0xFF444455),
    900: Color(0xFF0F0F0F),
  });

  /// The app background color.
  static const Color background = Color(0xFFFAFAFA);
}
