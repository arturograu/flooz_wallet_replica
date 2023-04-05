import 'package:flooz_wallet_replica/create_passcode/create_passcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePasscodePage extends StatelessWidget {
  const CreatePasscodePage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: CreatePasscodePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: BlocProvider<CreatePasscodeBloc>(
          create: (context) => CreatePasscodeBloc(),
          child: const CreatePasscodeForm(),
        ),
      ),
    );
  }
}
