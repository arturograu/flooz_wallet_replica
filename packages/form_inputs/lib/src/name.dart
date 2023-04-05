import 'package:formz/formz.dart';

/// Name input validation error
enum NameValidationError {
  /// Name is invalid (generic validation error)
  invalid
}

/// {@template name}
/// Reusable name form input.
/// {@endtemplate}
class Name extends FormzInput<String, NameValidationError> {
  /// {@macro name}
  const Name.pure() : super.pure('');

  /// {@macro name}
  const Name.dirty([super.value = '']) : super.dirty();

  static final RegExp _nameRegExp = RegExp(
    r'^[a-zA-Z]{2,}$',
  );

  @override
  NameValidationError? validator(String value) {
    return _nameRegExp.hasMatch(value) ? null : NameValidationError.invalid;
  }
}
