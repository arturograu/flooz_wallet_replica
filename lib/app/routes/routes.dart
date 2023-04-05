import 'package:flooz_wallet_replica/app/app.dart';
import 'package:flooz_wallet_replica/create_account/create_account.dart';
import 'package:flooz_wallet_replica/create_passcode/create_passcode.dart';
import 'package:flooz_wallet_replica/home/home.dart';
import 'package:flutter/material.dart';

List<Page<dynamic>> onGenerateAppPages(
  User user,
  List<Page<dynamic>> pages,
) {
  if (user.isComplete) {
    return [HomePage.page(name: user.name!, email: user.email!)];
  } else if (user.hasAccount) {
    return [
      CreateAccountPage.page(),
      CreatePasscodePage.page(),
    ];
  } else {
    return [CreateAccountPage.page()];
  }
}
