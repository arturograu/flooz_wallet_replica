import 'package:app_ui/app_ui.dart';
import 'package:flooz_wallet_replica/app/app.dart';
import 'package:flooz_wallet_replica/create_passcode/create_passcode.dart';
import 'package:flooz_wallet_replica/l10n/l10n.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CreatePasscodeForm extends StatelessWidget {
  const CreatePasscodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<CreatePasscodeBloc, CreatePasscodeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          context
              .flow<User>()
              .update((user) => user.copyWith(passcode: state.passcode.value));
        }
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              ErrorSnackBar(text: state.passcode.getErrorMessage(l10n)),
            );
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xlg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.createPasscodePageTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  EmojiParser().emojify(l10n.createPasscodePageDescription),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.xxlg + AppSpacing.xxs),
                const _PasscodeInput(),
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

class _PasscodeInput extends StatelessWidget {
  const _PasscodeInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePasscodeBloc, CreatePasscodeState>(
      buildWhen: (previous, current) => previous.passcode != current.passcode,
      builder: (context, state) {
        return PinCodeTextField(
          key: const Key('createPasscodeForm_passcodeTextField'),
          appContext: context,
          onChanged: (passcode) => context
              .read<CreatePasscodeBloc>()
              .add(CreatePasscodeEvent.passcodeChanged(passcode)),
          readOnly: state.status.isInProgress,
          length: 6,
          autoFocus: true,
          obscureText: true,
          animationType: AnimationType.fade,
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            borderWidth: 2,
            activeColor: AppColors.neutral90,
            selectedColor: AppColors.neutral90,
            inactiveColor: Colors.transparent,
            activeFillColor: AppColors.neutral.shade200,
            inactiveFillColor: AppColors.neutral.shade200,
            selectedFillColor: const Color(0xFFDADADA),
            shape: PinCodeFieldShape.circle,
            fieldWidth: 48,
            fieldHeight: 46,
          ),
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
    return BlocBuilder<CreatePasscodeBloc, CreatePasscodeState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return AppButton.wrapped(
          key: const Key('createPasscodeForm_continue_appButton'),
          onPressed: () => context
              .read<CreatePasscodeBloc>()
              .add(const CreatePasscodeEvent.createPasscodeSubmitted()),
          text: l10n.createPasscodeSubmitButtonText,
          isLoading: state.status.isInProgress,
        );
      },
    );
  }
}

extension on Passcode {
  String getErrorMessage(AppLocalizations l10n) {
    switch (error) {
      case PasscodeValidationError.invalid:
        return l10n.createPasscodePageError;
      case PasscodeValidationError.repeatedDigits:
        return l10n.createPasscodePageErrorRepeatingDigits;
      case PasscodeValidationError.sequentialDigits:
        return l10n.createPasscodePageErrorSequence;
      case null:
        return l10n.somethingWentWrongErrorMessage;
    }
  }
}
