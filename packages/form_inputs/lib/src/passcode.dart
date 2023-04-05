import 'package:formz/formz.dart';

/// Passcode input validation error
enum PasscodeValidationError {
  /// Passcode is invalid (generic validation error)
  invalid,

  /// Passcode is repeating
  repeatedDigits,

  /// Passcode is sequential
  sequentialDigits,
}

/// {@template passcode}
/// Reusable passcode form input.
/// {@endtemplate}
class Passcode extends FormzInput<String, PasscodeValidationError> {
  /// {@macro passcode}
  const Passcode.pure() : super.pure('');

  /// {@macro passcode}
  const Passcode.dirty([super.value = '']) : super.dirty();

  /// Passcode must be 6 digits
  static final RegExp _passcodeRegExp = RegExp(r'^\d{6}$');

  /// Digits should not repeat themselves more than 2 times
  /// (e.g. 111234, 222334, 315353)
  static bool _isRepeating(List<int> passcode) {
    final map = <int, int>{};
    for (final digit in passcode) {
      if (!map.containsKey(digit)) {
        map[digit] = 1;
      } else {
        var count = map[digit]!;
        count = count + 1;
        if (count > 2) {
          return true;
        }
        map[digit] = count;
      }
    }
    return false;
  }

  /// Passcode must not be in a sequential order, neither forward nor backward
  /// (e.g. 123456, 654321)
  static bool _isSequence(List<int> passcode) =>
      passcode.isSequence() || passcode.reversed.toList().isSequence();

  @override
  PasscodeValidationError? validator(String value) {
    if (!_passcodeRegExp.hasMatch(value)) {
      return PasscodeValidationError.invalid;
    }
    final passcode = value.split('').map(int.parse).toList();
    if (_isRepeating(passcode)) {
      return PasscodeValidationError.repeatedDigits;
    }
    if (_isSequence(passcode)) {
      return PasscodeValidationError.sequentialDigits;
    }
    return null;
  }
}

extension on List<int> {
  bool isSequence() {
    var isSequence = true;
    for (var i = 0; i < length - 1; i++) {
      if (_nextIsSequential(i)) {
        continue;
      }
      isSequence = false;
    }
    return isSequence;
  }

  bool _nextIsSequential(int index) => this[index].isSequential(_next(index));

  int _next(int index) => this[index + 1];
}

extension on int {
  bool isSequential(int other) => this + 1 == other;
}
