import 'package:flooz_wallet_replica/create_account/create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CreateAccountPage', () {
    test('is a page', () {
      expect(CreateAccountPage.page(), isA<Page<void>>());
    });

    testWidgets('renders a CreateAccountForm', (tester) async {
      await tester.pumpApp(const CreateAccountPage());
      expect(find.byType(CreateAccountForm), findsOneWidget);
    });
  });
}
