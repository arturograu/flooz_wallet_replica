import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// Shadows used in the App UI Kit.
abstract class AppShadows {
  /// The lightTheme shadow3
  static List<BoxShadow> lightThemeShadow3 = [
    BoxShadow(
      color: Colors.black.withOpacity(.14),
      offset: const Offset(0, AppSpacing.lg),
      blurRadius: AppSpacing.xlg + AppSpacing.sm,
      spreadRadius: -AppSpacing.sm,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(.08),
      offset: const Offset(0, AppSpacing.xs + AppSpacing.xxs),
      blurRadius: AppSpacing.md + AppSpacing.xxs,
      spreadRadius: -AppSpacing.sm,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(.06),
      blurRadius: AppSpacing.xxs,
    ),
  ];
}
