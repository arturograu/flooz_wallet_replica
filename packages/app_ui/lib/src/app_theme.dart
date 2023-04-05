import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template app_theme}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Default `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      snackBarTheme: _snackBarTheme,
      appBarTheme: _appBarTheme,
    );
  }

  ColorScheme get _colorScheme {
    return const ColorScheme.light(
      background: AppColors.background,
    );
  }

  TextTheme get _textTheme {
    return GoogleFonts.albertSansTextTheme(
      TextTheme(
        displaySmall: AppTextStyle.heading3,
        headlineSmall: AppTextStyle.heading5,
        labelLarge: AppTextStyle.xl,
        titleMedium: AppTextStyle.lMedium.apply(
          color: AppColors.neutral.shade500,
        ),
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm - AppSpacing.xxxs,
        horizontal: AppSpacing.sm + AppSpacing.xxs,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.md),
        borderSide: BorderSide.none,
      ),
      fillColor: AppColors.neutral.shade200,
      filled: true,
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.lg),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.lg,
          horizontal: AppSpacing.sm + AppSpacing.xxs,
        ),
        elevation: 0,
      ),
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      backgroundColor: Colors.white,
      contentTextStyle: AppTextStyle.l,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(92),
      ),
      behavior: SnackBarBehavior.floating,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg + AppSpacing.xs,
        vertical: AppSpacing.sm + AppSpacing.xxs,
      ),
      elevation: 0,
    );
  }

  AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Color(0xFF323232),
        size: 18,
      ),
    );
  }
}
