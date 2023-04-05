import 'package:app_ui/app_ui.dart';
import 'package:flooz_wallet_replica/app/app.dart';
import 'package:flooz_wallet_replica/create_account/create_account.dart';
import 'package:flooz_wallet_replica/l10n/l10n.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final headlineSmall = textTheme.headlineSmall;
    const contentSpacing = AppSpacing.lg + AppSpacing.xs;
    return BlocListener<CreateAccountBloc, CreateAccountState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          final name = state.name.value;
          final email = state.email.value;
          context
              .flow<User>()
              .update((user) => user.copyWith(name: name, email: email));
        }
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              ErrorSnackBar(text: l10n.somethingWentWrongErrorMessage),
            );
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: contentSpacing,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.createAccountPageTitle,
                  style: textTheme.displaySmall,
                ),
                const SizedBox(height: contentSpacing),
                Text(
                  l10n.createAccountNameLabel,
                  style: headlineSmall,
                ),
                const _NameInput(),
                const SizedBox(height: contentSpacing),
                Text(
                  l10n.createAccountEmailLabel,
                  style: headlineSmall,
                ),
                const _EmailInput(),
              ],
            ),
          ),
          const Spacer(),
          const _SubmitButton(),
        ],
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          key: const Key('createAccountForm_nameInput_textField'),
          readOnly: state.status.isInProgress,
          onChanged: (name) => context
              .read<CreateAccountBloc>()
              .add(CreateAccountEvent.nameChanged(name)),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('createAccountForm_emailInput_textField'),
          readOnly: state.status.isInProgress,
          onChanged: (email) => context
              .read<CreateAccountBloc>()
              .add(CreateAccountEvent.emailChanged(email)),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return AppButton.wrapped(
          key: const Key('createAccountForm_continue_appButton'),
          onPressed: () => context
              .read<CreateAccountBloc>()
              .add(const CreateAccountEvent.createAccountSubmitted()),
          text: l10n.createAccountNextButton,
          isLoading: state.status.isInProgress,
        );
      },
    );
  }
}
