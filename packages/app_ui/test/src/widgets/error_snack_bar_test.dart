import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('ErrorSnackBar', () {
    testWidgets('renders ErrorSnackBar', (tester) async {
      const buttonText = 'Show';
      await tester.pumpApp(
        theme: const AppTheme().themeData,
        Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(ErrorSnackBar(text: 'Error text'));
              },
              child: const Text(buttonText),
            );
          },
        ),
      );
      await tester.tap(find.text(buttonText));
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
