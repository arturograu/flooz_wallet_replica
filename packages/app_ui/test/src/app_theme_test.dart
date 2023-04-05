import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  group('AppTheme', () {
    group('themeData', () {
      group('color', () {
        test('primary is AppColors.primary', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme().themeData.primaryColor,
            AppColors.primary,
          );
        });

        test('background is AppColors.background', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme().themeData.colorScheme.background,
            AppColors.background,
          );
        });
      });

      group('text', () {
        test('displaySmall is AppTextStyle heading3', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme().themeData.textTheme.displaySmall,
            GoogleFonts.albertSans(textStyle: AppTextStyle.heading3),
          );
        });

        test('headlineSmall is AppTextStyle heading5', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme().themeData.textTheme.headlineSmall,
            GoogleFonts.albertSans(textStyle: AppTextStyle.heading5),
          );
        });

        test('labelLarge is AppTextStyle xl', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme().themeData.textTheme.labelLarge,
            GoogleFonts.albertSans(textStyle: AppTextStyle.xl),
          );
        });
      });

      group('inputs', () {
        test('contentPadding is AppSpacing.sm - AppSpacing.xxxs', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme().themeData.inputDecorationTheme.contentPadding,
            const EdgeInsets.symmetric(
              vertical: AppSpacing.sm - AppSpacing.xxxs,
              horizontal: AppSpacing.sm + AppSpacing.xxs,
            ),
          );
        });

        test('border is OutlineInputBorder', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme().themeData.inputDecorationTheme.border,
            const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSpacing.md)),
              borderSide: BorderSide.none,
            ),
          );
        });

        test('fillColor is AppColors.neutral.shade200', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme().themeData.inputDecorationTheme.fillColor,
            AppColors.neutral.shade200,
          );
        });

        test('filled is true', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme().themeData.inputDecorationTheme.filled,
            true,
          );
        });
      });

      group('buttons', () {
        test('shape returns circular border radius', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme()
                .themeData
                .elevatedButtonTheme
                .style
                ?.shape
                ?.resolve({}),
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSpacing.lg)),
            ),
          );
        });

        test('vertical padding is lg and horizontal is sm + xxs', () {
          WidgetsFlutterBinding.ensureInitialized();
          expect(
            const AppTheme()
                .themeData
                .elevatedButtonTheme
                .style
                ?.padding
                ?.resolve({}),
            const EdgeInsets.symmetric(
              vertical: AppSpacing.lg,
              horizontal: AppSpacing.sm + AppSpacing.xxs,
            ),
          );
        });
      });
    });
  });
}
