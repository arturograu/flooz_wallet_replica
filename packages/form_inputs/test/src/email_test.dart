import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const validEmail = 'jane.doea@doelabs.com';
  const emailWithoutAtSymbol = 'doelabs.com';
  const emailWithoutDotSymbol = 'jane@doelabs';
  group('Email', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const email = Email.pure();
        expect(email.value, '');
        expect(email.isPure, true);
      });

      test('dirty creates correct instance', () {
        const email = Email.dirty(validEmail);
        expect(email.value, validEmail);
        expect(email.isPure, false);
      });
    });

    group('validator', () {
      test('returns invalid error when email is empty', () {
        expect(
          const Email.dirty().error,
          EmailValidationError.invalid,
        );
      });

      test('returns invalid error when email is missing @ symbol', () {
        expect(
          const Email.dirty(emailWithoutAtSymbol).error,
          EmailValidationError.invalid,
        );
      });

      test('returns invalid error when email is missing . symbol', () {
        expect(
          const Email.dirty(emailWithoutDotSymbol).error,
          EmailValidationError.invalid,
        );
      });

      test('is valid when email is valid', () {
        expect(
          const Email.dirty(validEmail).error,
          isNull,
        );
      });
    });
  });
}
