import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_wallet_replica/create_account/create_account.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

void main() {
  const validName = 'Jane';
  const validEmail = 'jane.doe@doelabs.com';

  group('CreateAccountBloc', () {
    test('initial state is CreateAccountState', () {
      expect(CreateAccountBloc().state, const CreateAccountState());
    });

    group('CreateAccountSubmitted', () {
      blocTest<CreateAccountBloc, CreateAccountState>(
        'emits [submissionInProgress, submissionSuccess] on valid form '
        'submission',
        build: CreateAccountBloc.new,
        act: (bloc) => bloc
          ..add(const CreateAccountEvent.nameChanged(validName))
          ..add(const CreateAccountEvent.emailChanged(validEmail))
          ..add(const CreateAccountEvent.createAccountSubmitted()),
        expect: () => const <CreateAccountState>[
          CreateAccountState(name: Name.dirty(validName)),
          CreateAccountState(
            name: Name.dirty(validName),
            email: Email.dirty(validEmail),
          ),
          CreateAccountState(
            name: Name.dirty(validName),
            email: Email.dirty(validEmail),
            status: FormzSubmissionStatus.inProgress,
          ),
          CreateAccountState(
            name: Name.dirty(validName),
            email: Email.dirty(validEmail),
            status: FormzSubmissionStatus.success,
          ),
        ],
      );

      blocTest<CreateAccountBloc, CreateAccountState>(
        'emits [submissionInProgress, submissionFailure] on invalid submission',
        build: CreateAccountBloc.new,
        act: (bloc) =>
            bloc.add(const CreateAccountEvent.createAccountSubmitted()),
        expect: () => const <CreateAccountState>[
          CreateAccountState(status: FormzSubmissionStatus.inProgress),
          CreateAccountState(status: FormzSubmissionStatus.failure),
        ],
      );
    });
  });
}
