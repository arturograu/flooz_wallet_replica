part of 'create_passcode_bloc.dart';

class CreatePasscodeState extends Equatable with FormzMixin {
  const CreatePasscodeState({
    this.passcode = const Passcode.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final Passcode passcode;
  final FormzSubmissionStatus status;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [passcode];

  @override
  List<Object> get props => [passcode, status];

  CreatePasscodeState copyWith({
    Passcode? passcode,
    FormzSubmissionStatus? status,
  }) {
    return CreatePasscodeState(
      passcode: passcode ?? this.passcode,
      status: status ?? this.status,
    );
  }
}
