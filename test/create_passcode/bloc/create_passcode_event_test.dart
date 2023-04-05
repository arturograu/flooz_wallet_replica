import 'package:flooz_wallet_replica/create_passcode/create_passcode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const passcode = '827365';

  group('CreatePasscodeEvent', () {
    group('PasscodeChanged', () {
      test('supports value comparisons', () {
        expect(
          const CreatePasscodeEvent.passcodeChanged(passcode),
          const CreatePasscodeEvent.passcodeChanged(passcode),
        );
      });
    });

    group('CreatePasscodeSubmitted', () {
      test('supports value comparisons', () {
        expect(
          const CreatePasscodeEvent.createPasscodeSubmitted(),
          const CreatePasscodeEvent.createPasscodeSubmitted(),
        );
      });
    });
  });
}
