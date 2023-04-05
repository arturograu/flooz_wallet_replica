import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_wallet_replica/app/app.dart';
import 'package:flooz_wallet_replica/create_account/create_account.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockCreateAccountBloc
    extends MockBloc<CreateAccountEvent, CreateAccountState>
    implements CreateAccountBloc {}

class MockFlowController extends Mock implements FlowController<User> {}

void main() {
  const nextButtonKey = Key('createAccountForm_continue_appButton');
  const nameInputKey = Key('createAccountForm_nameInput_textField');
  const emailInputKey = Key('createAccountForm_emailInput_textField');

  group('CreateAccountForm', () {
    late CreateAccountBloc createAccountBloc;
    late FlowController<User> flowController;

    setUp(() {
      createAccountBloc = MockCreateAccountBloc();
      flowController = MockFlowController();
      when(() => createAccountBloc.state)
          .thenReturn(const CreateAccountState());
      when(() => flowController.state).thenReturn(User.empty);
      when(() => flowController.update(any())).thenAnswer((_) async {});
    });

    group('adds', () {
      testWidgets('adds NameChanged to CreateAccountBloc when name is updated',
          (tester) async {
        const name = 'John';
        await tester.pumpApp(
          BlocProvider.value(
            value: createAccountBloc,
            child: const CreateAccountForm(),
          ),
        );
        await tester.enterText(find.byKey(nameInputKey), name);
        verify(
          () =>
              createAccountBloc.add(const CreateAccountEvent.nameChanged(name)),
        ).called(1);
      });

      testWidgets(
          'adds EmailChanged to CreateAccountBloc when email is updated',
          (tester) async {
        const email = 'john.doe@doelabs.com';
        await tester.pumpApp(
          BlocProvider.value(
            value: createAccountBloc,
            child: const CreateAccountForm(),
          ),
        );
        await tester.enterText(find.byKey(emailInputKey), email);
        verify(
          () => createAccountBloc
              .add(const CreateAccountEvent.emailChanged(email)),
        ).called(1);
      });

      testWidgets(
          'adds CreateAccountSubmitted to CreateAccountBloc when form is '
          'submitted', (tester) async {
        await tester.pumpApp(
          BlocProvider.value(
            value: createAccountBloc,
            child: const CreateAccountForm(),
          ),
        );
        await tester.tap(find.byKey(nextButtonKey));
        verify(
          () => createAccountBloc
              .add(const CreateAccountEvent.createAccountSubmitted()),
        ).called(1);
      });
    });

    group('calls', () {
      testWidgets('calls update user when form is submitted successfully',
          (tester) async {
        whenListen(
          createAccountBloc,
          Stream.fromIterable(const <CreateAccountState>[
            CreateAccountState(status: FormzSubmissionStatus.success),
          ]),
        );
        await tester.pumpApp(
          BlocProvider(
            create: (context) => createAccountBloc,
            child: FlowBuilder<User>(
              controller: flowController,
              onGeneratePages: (state, List<Page<dynamic>> pages) =>
                  const [MaterialPage<void>(child: CreateAccountForm())],
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
          createAccountBloc,
          Stream.fromIterable(const <CreateAccountState>[
            CreateAccountState(status: FormzSubmissionStatus.inProgress),
          ]),
        );
        await tester.pumpApp(
          theme: const AppTheme().themeData,
          BlocProvider.value(
            value: createAccountBloc,
            child: const CreateAccountForm(),
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
          createAccountBloc,
          Stream.fromIterable(const <CreateAccountState>[
            CreateAccountState(status: FormzSubmissionStatus.inProgress),
            CreateAccountState(status: FormzSubmissionStatus.failure),
          ]),
        );
        await tester.pumpApp(
          theme: const AppTheme().themeData,
          BlocProvider.value(
            value: createAccountBloc,
            child: const CreateAccountForm(),
          ),
        );
        await tester.pump();
        expect(find.byType(SnackBar), findsOneWidget);
      });
    });
  });
}
