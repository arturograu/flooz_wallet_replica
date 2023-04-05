import 'package:flooz_wallet_replica/create_passcode/create_passcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CreatePasscodePage', () {
    test('is a page', () {
      expect(CreatePasscodePage.page(), isA<Page<void>>());
    });

    testWidgets('renders a CreatePasscodeForm', (tester) async {
      await tester.pumpApp(const CreatePasscodePage());
      expect(find.byType(CreatePasscodeForm), findsOneWidget);
    });
  });
}
