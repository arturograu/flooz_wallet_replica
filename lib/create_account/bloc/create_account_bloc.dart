import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_bloc.freezed.dart';
part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc() : super(const CreateAccountState()) {
    on<NameChanged>(_onNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<CreateAccountSubmitted>(_onCreateAccountSubmitted);
  }

  void _onNameChanged(
    NameChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(name: Name.dirty(event.name)));
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(email: Email.dirty(event.email)));
  }

  Future<void> _onCreateAccountSubmitted(
    CreateAccountSubmitted event,
    Emitter<CreateAccountState> emit,
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
