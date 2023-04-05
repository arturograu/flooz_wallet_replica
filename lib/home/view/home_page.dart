import 'package:app_ui/app_ui.dart';
import 'package:flooz_wallet_replica/app/app.dart';
import 'package:flooz_wallet_replica/assets.dart';
import 'package:flooz_wallet_replica/l10n/l10n.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.name,
    required this.email,
    super.key,
  });

  final String name;
  final String email;

  static Page<void> page({
    required String name,
    required String email,
  }) =>
      MaterialPage<void>(child: HomePage(name: name, email: email));

  void _logout(BuildContext context) =>
      context.flow<User>().update((_) => User.empty);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            children: [
              const SizedBox(height: 105),
              Image.asset(Assets.profileImage),
              const SizedBox(height: AppSpacing.xlg - AppSpacing.xs),
              Text(
                name,
                style: textTheme.displaySmall,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                email,
                style: textTheme.titleMedium,
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onPressed: () => _logout(context),
                      text: l10n.homeClearAccountButton,
                      isSecondary: true,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.lg - AppSpacing.xxxs),
                  Expanded(
                    child: AppButton(
                      onPressed: () => _logout(context),
                      text: l10n.homeLogoutButton,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSpacing.lg + AppSpacing.md + AppSpacing.xxs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
