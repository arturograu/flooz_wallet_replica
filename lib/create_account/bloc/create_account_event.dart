part of 'create_account_bloc.dart';

@freezed
class CreateAccountEvent with _$CreateAccountEvent {
  const factory CreateAccountEvent.nameChanged(String name) = NameChanged;
  const factory CreateAccountEvent.emailChanged(String email) = EmailChanged;
  const factory CreateAccountEvent.createAccountSubmitted() =
      CreateAccountSubmitted;
}
