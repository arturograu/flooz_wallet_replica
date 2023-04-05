import 'package:flooz_wallet_replica/create_account/create_account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const name = 'John';
  const email = 'john.doe@doelabs.com';

  group('CreateAccountEvent', () {
    group('NameChanged', () {
      test('supports value comparisons', () {
        expect(
          const CreateAccountEvent.nameChanged(name),
          const CreateAccountEvent.nameChanged(name),
        );
      });
    });

    group('EmailChanged', () {
      test('supports value comparisons', () {
        expect(
          const CreateAccountEvent.emailChanged(email),
          const CreateAccountEvent.emailChanged(email),
        );
      });
    });

    group('CreateAccountSubmitted', () {
      test('supports value comparisons', () {
        expect(
          const CreateAccountEvent.createAccountSubmitted(),
          const CreateAccountEvent.createAccountSubmitted(),
        );
      });
    });
  });
}
