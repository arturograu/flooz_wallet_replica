part of 'create_account_bloc.dart';

class CreateAccountState extends Equatable with FormzMixin {
  const CreateAccountState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final Name name;
  final Email email;
  final FormzSubmissionStatus status;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [name, email];

  @override
  List<Object> get props => [name, email, status];

  CreateAccountState copyWith({
    Name? name,
    Email? email,
    FormzSubmissionStatus? status,
  }) {
    return CreateAccountState(
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }
}
