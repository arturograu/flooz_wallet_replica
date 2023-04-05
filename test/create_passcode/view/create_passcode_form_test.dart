import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_wallet_replica/app/app.dart';
import 'package:flooz_wallet_replica/create_passcode/create_passcode.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockCreatePasscodeBloc
    extends MockBloc<CreatePasscodeEvent, CreatePasscodeState>
    implements CreatePasscodeBloc {}

class MockPasscode extends Mock implements Passcode {}

class MockFlowController extends Mock implements FlowController<User> {}

void main() {
  const passcodeTextField = Key('createPasscodeForm_passcodeTextField');
  const submitButton = Key('createPasscodeForm_continue_appButton');

  group('CreatePasscodeForm', () {
    late CreatePasscodeBloc createPasscodeBloc;
    late Passcode passcode;
    late FlowController<User> flowController;

    setUp(() {
      createPasscodeBloc = MockCreatePasscodeBloc();
      passcode = MockPasscode();
      flowController = MockFlowController();
      when(() => createPasscodeBloc.state)
          .thenReturn(const CreatePasscodeState());
      when(() => flowController.state).thenReturn(User.empty);
      when(() => flowController.update(any())).thenAnswer((_) async {});
    });

    group('adds', () {
      testWidgets('adds PasscodeChanged when passcode is updated',
          (tester) async {
        const passcode = '927502';
        await tester.pumpApp(
          BlocProvider.value(
            value: createPasscodeBloc,
            child: const CreatePasscodeForm(),
          ),
        );
        await tester.enterText(find.byKey(passcodeTextField), passcode);
        verify(
          () => createPasscodeBloc
              .add(const CreatePasscodeEvent.passcodeChanged(passcode)),
        ).called(1);
      });

      testWidgets('adds CreatePasscodeSubmitted when form is submitted',
          (tester) async {
        await tester.pumpApp(
          BlocProvider.value(
            value: createPasscodeBloc,
            child: const CreatePasscodeForm(),
          ),
        );
        await tester.tap(find.byKey(submitButton));
        verify(
          () => createPasscodeBloc
              .add(const CreatePasscodeEvent.createPasscodeSubmitted()),
        ).called(1);
      });
    });

    group('calls', () {
      testWidgets('calls update user when form is submitted successfully',
          (tester) async {
        whenListen(
          createPasscodeBloc,
          Stream.fromIterable(const <CreatePasscodeState>[
            CreatePasscodeState(status: FormzSubmissionStatus.success),
          ]),
        );
        await tester.pumpApp(
          BlocProvider(
            create: (context) => createPasscodeBloc,
            child: FlowBuilder<User>(
              controller: flowController,
              onGeneratePages: (state, List<Page<dynamic>> pages) =>
                  const [MaterialPage<void>(child: CreatePasscodeForm())],
            ),
          ),
        );
        verify(() => flowController.update(any())).called(1);
      });
    });

    group('renders', () {
      testWidgets('login button shows loader when submission is in progress',
          (tester) async {
        whenListen(
          createPasscodeBloc,
          Stream.fromIterable(const <CreatePasscodeState>[
            CreatePasscodeState(status: FormzSubmissionStatus.inProgress),
          ]),
        );
        await tester.pumpApp(
          theme: const AppTheme().themeData,
          BlocProvider.value(
            value: createPasscodeBloc,
            child: const CreatePasscodeForm(),
          ),
        );
        await tester.pump();
        expect(
          find.descendant(
            of: find.byType(ElevatedButton),
            matching: find.byType(CircularProgressIndicator),
          ),
          findsOneWidget,
        );
      });

      testWidgets('SnackBar when submission fails', (tester) async {
        whenListen(
          createPasscodeBloc,
          Stream.fromIterable(const <CreatePasscodeState>[
            CreatePasscodeState(status: FormzSubmissionStatus.failure),
          ]),
        );
        await tester.pumpApp(
          theme: const AppTheme().themeData,
          BlocProvider.value(
            value: createPasscodeBloc,
            child: const CreatePasscodeForm(),
          ),
        );
        await tester.pump();
        expect(find.byType(SnackBar), findsOneWidget);
      });

      testWidgets(
        'SnackBar with create passcode standard error when passcode does not '
        'have 6 digits',
        (tester) async {
          when(() => passcode.error)
              .thenReturn(PasscodeValidationError.invalid);
          whenListen(
            createPasscodeBloc,
            Stream.fromIterable(<CreatePasscodeState>[
              CreatePasscodeState(
                passcode: passcode,
                status: FormzSubmissionStatus.failure,
              ),
            ]),
          );
          await tester.pumpApp(
            theme: const AppTheme().themeData,
            BlocProvider.value(
              value: createPasscodeBloc,
              child: const CreatePasscodeForm(),
            ),
          );
          await tester.pump();
          expect(
            find.textContaining('Passcode must consist of 6 digits'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
          'SnackBar with repeated digits error text when '
          'PasscodeValidationError is repeatedDigits', (tester) async {
        when(() => passcode.error)
            .thenReturn(PasscodeValidationError.repeatedDigits);
        whenListen(
          createPasscodeBloc,
          Stream.fromIterable(<CreatePasscodeState>[
            CreatePasscodeState(
              passcode: passcode,
              status: FormzSubmissionStatus.failure,
            ),
          ]),
        );
        await tester.pumpApp(
          theme: const AppTheme().themeData,
          BlocProvider.value(
            value: createPasscodeBloc,
            child: const CreatePasscodeForm(),
          ),
        );
        await tester.pump();
        expect(
          find.textContaining(
            'Passcode must not contain digits repeating more than 2 times',
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Snackbar with sequential digits error text when passcode is '
          'sequential', (tester) async {
        when(() => passcode.error)
            .thenReturn(PasscodeValidationError.sequentialDigits);
        whenListen(
          createPasscodeBloc,
          Stream.fromIterable(<CreatePasscodeState>[
            CreatePasscodeState(
              passcode: passcode,
              status: FormzSubmissionStatus.failure,
            ),
          ]),
        );
        await tester.pumpApp(
          theme: const AppTheme().themeData,
          BlocProvider.value(
            value: createPasscodeBloc,
            child: const CreatePasscodeForm(),
          ),
        );
        await tester.pump();
        expect(
          find.textContaining('Passcode must not be in sequence'),
          findsOneWidget,
        );
      });

      testWidgets(
          'something went wrong error message when passcode error is null',
          (tester) async {
        when(() => passcode.error).thenReturn(null);
        whenListen(
          createPasscodeBloc,
          Stream.fromIterable(<CreatePasscodeState>[
            CreatePasscodeState(
              passcode: passcode,
              status: FormzSubmissionStatus.failure,
            ),
          ]),
        );
        await tester.pumpApp(
          theme: const AppTheme().themeData,
          BlocProvider.value(
            value: createPasscodeBloc,
            child: const CreatePasscodeForm(),
          ),
        );
        await tester.pump();
        expect(
          find.textContaining('Something went wrong'),
          findsOneWidget,
        );
      });
    });
  });
}
