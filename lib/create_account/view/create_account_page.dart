import 'package:app_ui/app_ui.dart';
import 'package:flooz_wallet_replica/create_account/create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: CreateAccountPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: AppSpacing.xxxlg + AppSpacing.sm),
          child: BlocProvider<CreateAccountBloc>(
            create: (context) => CreateAccountBloc(),
            child: const CreateAccountForm(),
          ),
        ),
      ),
    );
  }
}
