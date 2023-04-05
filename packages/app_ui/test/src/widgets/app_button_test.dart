import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppButton', () {
    testWidgets('renders button', (tester) async {
      await tester.pumpApp(
        AppButton(
          onPressed: () {},
          text: 'Test',
        ),
      );
      expect(find.byType(AppButton), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('renders button with secondary color', (tester) async {
      await tester.pumpApp(
        theme: const AppTheme().themeData,
        AppButton(
          key: const Key('secondary'),
          onPressed: () {},
          text: 'Test',
          isSecondary: true,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(AppButton), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;
      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.neutral.shade700,
      );
    });

    testWidgets('renders progress indicator', (tester) async {
      await tester.pumpApp(
        AppButton(
          onPressed: () {},
          text: 'Test',
          isLoading: true,
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('WrappedAppButton', () {
    testWidgets('renders button wrapper', (tester) async {
      await tester.pumpApp(
        AppButton.wrapped(
          onPressed: () {},
          text: 'Test',
        ),
      );

      final finder = find.byType(Container);
      final widget = tester.widget(finder) as Container;

      expect(
        widget.margin,
        const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg + AppSpacing.md + AppSpacing.xxs,
        ),
      );
    });
  });
}
