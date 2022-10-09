import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/money_exchange_api_service.dart';
import 'package:currency_converter/ui/views/landing/landing_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LandingViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('loadMyMonitoredCurrencies -', () {
      test(
          'When the user monitored currencies is empty, Currencies field should stay empty',
          () async {
        getAndRegisterSharedPreferencesService(myCurrencies: []);
        final model = LandingViewModel();

        await model.loadMyMonitoredCurrencies();

        expect(model.currencies, isEmpty);
      });

      test(
          'When the user monitored currencies is not empty, Should fetch those currencies latest rates',
          () async {
        getAndRegisterSharedPreferencesService(myCurrencies: ['USD']);
        final moneyExchangeApiService = getAndRegisterMoneyExchangeApiService();

        final model = LandingViewModel();
        await model.loadMyMonitoredCurrencies();

        verify(moneyExchangeApiService.getCurrenciesExchangeRates(['USD']));
      });
      test('When called successfully, Should set the currencies field',
          () async {
        getAndRegisterSharedPreferencesService(myCurrencies: ['USD']);

        getAndRegisterMoneyExchangeApiService(currencies: [
          const Currency(abbrivation: 'USD'),
        ]);

        final model = LandingViewModel();
        await model.loadMyMonitoredCurrencies();
        expect(model.currencies.length, 1);
      });
      test('When any error happen, Should set the model hasError to true',
          () async {
        getAndRegisterSharedPreferencesService(myCurrencies: ['USD']);
        final moneyExchangeApiService = getAndRegisterMoneyExchangeApiService();

        when(moneyExchangeApiService.getCurrenciesExchangeRates(['USD']))
            .thenThrow(Exception('Network error'));

        final model = LandingViewModel();

        await model.loadMyMonitoredCurrencies();
        expect(model.hasError, isTrue);
      });
    });
  });
}
