import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    String? name,
    String? email,
    String? passcode,
  }) = _User;

  const User._();

  static const empty = User();

  bool get hasAccount => name != null && email != null;

  bool get isComplete => hasAccount && passcode != null;
}
