import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Text styles for the App UI.
abstract class AppTextStyle {
  static final _baseTextStyle = GoogleFonts.albertSans(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w600,
  );

  /// The heading3 text style.
  static final TextStyle heading3 = _baseTextStyle.copyWith(
    color: AppColors.neutral.shade900,
    fontSize: 32,
    height: 1.5,
  );

  /// The heading5 text style.
  static final TextStyle heading5 = _baseTextStyle.copyWith(
    color: Colors.black,
    fontSize: 20,
    height: 1.6,
  );

  /// The textL style.
  static final TextStyle l = _baseTextStyle.copyWith(
    color: AppColors.neutral.shade900,
    fontSize: 16,
    height: 1.3,
  );

  /// The textLMedium style.
  static final TextStyle lMedium = l.copyWith(fontWeight: FontWeight.w500);

  /// The textXlSemiBold style.
  static final TextStyle xl = _baseTextStyle.copyWith(
    color: AppColors.neutral.shade200,
    fontSize: 18,
    height: 1.3,
  );
}
