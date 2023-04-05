import 'package:flooz_wallet_replica/app/app.dart';
import 'package:flooz_wallet_replica/create_account/create_account.dart';
import 'package:flooz_wallet_replica/create_passcode/create_passcode.dart';
import 'package:flooz_wallet_replica/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUser extends Mock implements User {}

void main() {
  group('onGenerateAppPages', () {
    late User user;

    setUp(() {
      user = MockUser();
    });

    test('returns [CreateAccountPage] when user is empty', () {
      when(() => user.isComplete).thenReturn(false);
      when(() => user.hasAccount).thenReturn(false);
      expect(
        onGenerateAppPages(user, []),
        [
          isA<MaterialPage<void>>().having(
            (p) => p.child,
            'child',
            isA<CreateAccountPage>(),
          )
        ],
      );
    });

    test(
        'returns [CreateAccountPage, CreatePasscodePage] when user has account',
        () {
      when(() => user.isComplete).thenReturn(false);
      when(() => user.hasAccount).thenReturn(true);
      expect(
        onGenerateAppPages(user, []),
        [
          isA<MaterialPage<void>>().having(
            (p) => p.child,
            'child',
            isA<CreateAccountPage>(),
          ),
          isA<MaterialPage<void>>().having(
            (p) => p.child,
            'child',
            isA<CreatePasscodePage>(),
          ),
        ],
      );
    });

    test('returns [HomePage] when user is complete', () {
      when(() => user.isComplete).thenReturn(true);
      when(() => user.hasAccount).thenReturn(true);
      when(() => user.name).thenReturn('Jane');
      when(() => user.email).thenReturn('jane@doelabs.com');
      expect(
        onGenerateAppPages(user, []),
        [
          isA<MaterialPage<void>>().having(
            (p) => p.child,
            'child',
            isA<HomePage>(),
          )
        ],
      );
    });
  });
}
