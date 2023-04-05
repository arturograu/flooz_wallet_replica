import 'package:flooz_wallet_replica/create_passcode/create_passcode.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

void main() {
  const passcode = '827365';

  group('CreatePasscodeState', () {
    test('supports value comparisons', () {
      expect(const CreatePasscodeState(), const CreatePasscodeState());
    });

    test('returns same object when no properties are passed', () {
      expect(
        const CreatePasscodeState().copyWith(),
        const CreatePasscodeState(),
      );
    });

    test('returns object with updated passcode when passcode is passed', () {
      expect(
        const CreatePasscodeState()
            .copyWith(passcode: const Passcode.dirty(passcode)),
        const CreatePasscodeState(
          passcode: Passcode.dirty(passcode),
        ),
      );
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const CreatePasscodeState()
            .copyWith(status: FormzSubmissionStatus.inProgress),
        const CreatePasscodeState(
          status: FormzSubmissionStatus.inProgress,
        ),
      );
    });
  });
}
