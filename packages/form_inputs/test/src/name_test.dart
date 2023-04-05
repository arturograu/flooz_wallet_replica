import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const validName = 'John';
  const nameWithOneCharacter = 'J';
  const nameWithEmptySpaces = 'Jane ';
  const nameWithSymbols = 'Jane@';
  const nameWithNumbers = 'Jane1';
  group('Name', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const name = Name.pure();
        expect(name.value, '');
        expect(name.isPure, true);
      });

      test('dirty creates correct instance', () {
        const name = Name.dirty(validName);
        expect(name.value, validName);
        expect(name.isPure, false);
      });
    });

    group('validator', () {
      test('returns invalid error when name is empty', () {
        expect(
          const Name.dirty().error,
          NameValidationError.invalid,
        );
      });

      test('returns invalid error when name is too short', () {
        expect(
          const Name.dirty(nameWithOneCharacter).error,
          NameValidationError.invalid,
        );
      });

      test('returns invalid error when name contains empty spaces', () {
        expect(
          const Name.dirty(nameWithEmptySpaces).error,
          NameValidationError.invalid,
        );
      });

      test('returns invalid error when name contains symbols', () {
        expect(
          const Name.dirty(nameWithSymbols).error,
          NameValidationError.invalid,
        );
      });

      test('returns invalid error when name contains numbers', () {
        expect(
          const Name.dirty(nameWithNumbers).error,
          NameValidationError.invalid,
        );
      });

      test('is valid when name is valid', () {
        expect(
          const Name.dirty(validName).error,
          isNull,
        );
      });
    });
  });
}
