import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_passcode_bloc.freezed.dart';
part 'create_passcode_event.dart';
part 'create_passcode_state.dart';

class CreatePasscodeBloc
    extends Bloc<CreatePasscodeEvent, CreatePasscodeState> {
  CreatePasscodeBloc() : super(const CreatePasscodeState()) {
    on<_PasscodeChanged>(_onPasscodeChanged);
    on<_CreatePasscodeSubmitted>(_onCreatePasscodeSubmitted);
  }

  void _onPasscodeChanged(
    _PasscodeChanged event,
    Emitter<CreatePasscodeState> emit,
  ) {
    emit(state.copyWith(passcode: Passcode.dirty(event.passcode)));
  }

  Future<void> _onCreatePasscodeSubmitted(
    _CreatePasscodeSubmitted event,
    Emitter<CreatePasscodeState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    emit(
      state.copyWith(
        status: state.isValid
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
      ),
    );
  }
}
