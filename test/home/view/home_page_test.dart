import 'package:flooz_wallet_replica/app/app.dart';
import 'package:flooz_wallet_replica/home/home.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockFlowController extends Mock implements FlowController<User> {}

void main() {
  const name = 'John';
  const email = 'john@doelabs.com';

  group('HomePage', () {
    late FlowController<User> flowController;

    setUp(() {
      flowController = MockFlowController();
      when(() => flowController.state).thenReturn(User.empty);
      when(() => flowController.update(any())).thenAnswer((_) async {});
    });

    test('is a Page', () {
      expect(HomePage.page(name: name, email: email), isA<Page<void>>());
    });

    group('renders', () {
      testWidgets('renders UI elements', (tester) async {
        await tester.pumpApp(const HomePage(name: name, email: email));
        expect(find.byType(Image), findsOneWidget);
        expect(find.byType(Text), findsNWidgets(4));
        expect(find.byType(ElevatedButton), findsNWidgets(2));
      });
    });

    group('calls', () {
      testWidgets('calls update when logout button is tapped', (tester) async {
        await tester.pumpApp(
          FlowBuilder<User>(
            controller: flowController,
            onGeneratePages: (state, List<Page<dynamic>> pages) =>
                [HomePage.page(name: name, email: email)],
          ),
        );
        await tester.tap(find.text('Log out'));
        verify(() => flowController.update(any())).called(1);
      });

      testWidgets('calls update when clear account button is tapped',
          (tester) async {
        await tester.pumpApp(
          FlowBuilder<User>(
            controller: flowController,
            onGeneratePages: (state, List<Page<dynamic>> pages) =>
                [HomePage.page(name: name, email: email)],
          ),
        );
        await tester.tap(find.text('Clear account'));
        verify(() => flowController.update(any())).called(1);
      });
    });
  });
}
