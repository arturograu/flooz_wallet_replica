import 'package:app_ui/app_ui.dart';
import 'package:flooz_wallet_replica/app/app.dart';
import 'package:flooz_wallet_replica/l10n/l10n.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: const AppTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const FlowBuilder<User>(
        state: User.empty,
        onGeneratePages: onGenerateAppPages,
      ),
    );
  }
}
