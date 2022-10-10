import 'package:currency_converter/app/app.locator.dart';
import 'package:currency_converter/services/shared_preferences_service.dart';
import 'package:currency_converter/ui/common/widgets/busy_widget.dart';
import 'package:currency_converter/ui/common/widgets/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:currency_converter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Adding one currency flow', (tester) async {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      await app.main();
      locator<SharedPreferencesService>().clearMemory();

      await tester.pumpAndSettle();

      expect(find.byType(BusyWidget), findsNothing);

      // There should be no currency cards
      expect(find.byType(CurrencyCard), findsNothing);

      // Emulate a tap on the floating action button.
      await tester.tap(find.byType(FloatingActionButton));

      // Trigger a frame.
      await tester.pumpAndSettle();

      expect(find.byType(CurrencyCard), findsWidgets);

      await tester.tap(find.byKey(const Key('CurrencyCard1')));

      await tester.pumpAndSettle();

      expect(find.byType(CurrencyCard), findsOneWidget);
    });
  });
}
