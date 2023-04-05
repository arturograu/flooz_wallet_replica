import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_wallet_replica/create_passcode/create_passcode.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

void main() {
  const validPascode = '827365';

  group('CreatePasscodeBloc', () {
    test('initial state is CreatePasscodeState', () {
      expect(
        CreatePasscodeBloc().state,
        const CreatePasscodeState(),
      );
    });

    group('CreatePasscodeSubmitted', () {
      blocTest<CreatePasscodeBloc, CreatePasscodeState>(
        'emits [submissionInProfress, submissionSuccess] on valid submission',
        build: CreatePasscodeBloc.new,
        act: (bloc) => bloc
          ..add(const CreatePasscodeEvent.passcodeChanged(validPascode))
          ..add(const CreatePasscodeEvent.createPasscodeSubmitted()),
        expect: () => const <CreatePasscodeState>[
          CreatePasscodeState(passcode: Passcode.dirty(validPascode)),
          CreatePasscodeState(
            passcode: Passcode.dirty(validPascode),
            status: FormzSubmissionStatus.inProgress,
          ),
          CreatePasscodeState(
            passcode: Passcode.dirty(validPascode),
            status: FormzSubmissionStatus.success,
          ),
        ],
      );

      blocTest<CreatePasscodeBloc, CreatePasscodeState>(
        'emits [submissionInProgress, submissionFailure] on invalid submission',
        build: CreatePasscodeBloc.new,
        act: (bloc) =>
            bloc.add(const CreatePasscodeEvent.createPasscodeSubmitted()),
        expect: () => const <CreatePasscodeState>[
          CreatePasscodeState(status: FormzSubmissionStatus.inProgress),
          CreatePasscodeState(status: FormzSubmissionStatus.failure),
        ],
      );
    });
  });
}
