part of 'create_passcode_bloc.dart';

@freezed
class CreatePasscodeEvent with _$CreatePasscodeEvent {
  const factory CreatePasscodeEvent.passcodeChanged(String passcode) =
      _PasscodeChanged;

  const factory CreatePasscodeEvent.createPasscodeSubmitted() =
      _CreatePasscodeSubmitted;
}
