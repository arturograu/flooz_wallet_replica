import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const validPasscode = '923374';
  const passcodeTooShort = '92387';
  const passcodeTooLong = '9238745';
  const passcodeWithNonNumericCharacters = '9238a4';
  const passcodeWithSpaces = '923 374';
  const passcodeWithSpecialCharacters = '9238@4';
  const passcodeWithRepeatingDigits = '323345';
  const passcodeInSequence = '123456';
  const passcodeInReverseSequence = '654321';
  const mixedSequence = '123432';

  group('Passcode', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const passcode = Passcode.pure();
        expect(passcode.value, '');
        expect(passcode.isPure, true);
      });

      test('dirty creates correct instance', () {
        const passcode = Passcode.dirty(validPasscode);
        expect(passcode.value, validPasscode);
        expect(passcode.isPure, false);
      });
    });

    group('validator', () {
      test('returns invalid error when passcode is empty', () {
        expect(
          const Passcode.dirty().error,
          PasscodeValidationError.invalid,
        );
      });

      test('returns invalid error when passcode is too short', () {
        expect(
          const Passcode.dirty(passcodeTooShort).error,
          PasscodeValidationError.invalid,
        );
      });

      test('returns invalid error when passcode is too long', () {
        expect(
          const Passcode.dirty(passcodeTooLong).error,
          PasscodeValidationError.invalid,
        );
      });

      test(
          'returns invalid error when passcode contains non-numeric characters',
          () {
        expect(
          const Passcode.dirty(passcodeWithNonNumericCharacters).error,
          PasscodeValidationError.invalid,
        );
      });

      test('returns invalid error when passcode contains spaces', () {
        expect(
          const Passcode.dirty(passcodeWithSpaces).error,
          PasscodeValidationError.invalid,
        );
      });

      test('returns invalid error when passcode contains special characters',
          () {
        expect(
          const Passcode.dirty(passcodeWithSpecialCharacters).error,
          PasscodeValidationError.invalid,
        );
      });

      test('returns invalid error when passcode contains repeated digits', () {
        expect(
          const Passcode.dirty(passcodeWithRepeatingDigits).error,
          PasscodeValidationError.repeatedDigits,
        );
      });

      test('returns invalid error when passcode is in sequence', () {
        expect(
          const Passcode.dirty(passcodeInSequence).error,
          PasscodeValidationError.sequentialDigits,
        );
      });

      test('returns invalid error when passcode is in reverse sequence', () {
        expect(
          const Passcode.dirty(passcodeInReverseSequence).error,
          PasscodeValidationError.sequentialDigits,
        );
      });

      test('is valid when is a mixed sequence', () {
        expect(
          const Passcode.dirty(mixedSequence).error,
          isNull,
        );
      });

      test('is valid when passcode is valid', () {
        expect(
          const Passcode.dirty(validPasscode).error,
          isNull,
        );
      });
    });
  });
}
