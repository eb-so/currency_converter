import 'package:currency_converter/app/app.router.dart';
import 'package:currency_converter/ui/views/landing/landing_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/constants.dart';
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
        getAndRegisterSharedPreferencesService(
            myCurrencies: [kUsd.abbrivation]);
        final moneyExchangeApiService = getAndRegisterMoneyExchangeApiService();

        final model = LandingViewModel();
        await model.loadMyMonitoredCurrencies();

        verify(moneyExchangeApiService
            .getCurrenciesExchangeRates([kUsd.abbrivation]));
      });
      test('When called successfully, Should set the currencies field',
          () async {
        getAndRegisterSharedPreferencesService(
            myCurrencies: [kUsd.abbrivation]);

        getAndRegisterMoneyExchangeApiService(currencies: [kUsd]);

        final model = LandingViewModel();
        await model.loadMyMonitoredCurrencies();
        expect(model.currencies.length, 1);
      });
      test('When any error happen, Should set the model hasError to true',
          () async {
        getAndRegisterSharedPreferencesService(
            myCurrencies: [kUsd.abbrivation]);
        final moneyExchangeApiService = getAndRegisterMoneyExchangeApiService();

        when(moneyExchangeApiService
                .getCurrenciesExchangeRates([kUsd.abbrivation]))
            .thenThrow(Exception('Network error'));

        final model = LandingViewModel();

        await model.loadMyMonitoredCurrencies();
        expect(model.hasError, isTrue);
      });
    });
    group('removeCurrency -', () {
      test('When called, Should remove a currency from the local storage', () {
        final sharedPreferencesService =
            getAndRegisterSharedPreferencesService();

        final model = LandingViewModel();
        model.removeCurrency(kUsd);

        verify(sharedPreferencesService.removeCurrency = kUsd.abbrivation);
      });
      test('When called, Should remove a currency from the [currencies] field',
          () {
        final model = LandingViewModel();
        model.currencies = [kUsd, kAed];

        model.removeCurrency(kUsd);
        expect(model.currencies.length, 1);
      });
    });

    group('AddNewCurrency -', () {
      test('When called, Should navigate to [currencyPickerView]', () {
        final navigationService = getAndRegisterNavigationService();

        final model = LandingViewModel();
        model.addNewCurrency();
        verify(navigationService.navigateTo(Routes.currencyPickerView));
      });
    });
  });
}
