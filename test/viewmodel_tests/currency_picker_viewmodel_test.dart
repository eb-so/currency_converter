import 'package:currency_converter/ui/views/currency_picker/currency_picker_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/constants.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('CurrencyPickerViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('loadAllCurrenciesExcept -', () {
      test('Should load all currency except the ones users already added',
          () async {
        getAndRegisterSharedPreferencesService(
            myCurrencies: [kAed.abbrivation]);
        getAndRegisterMoneyExchangeApiService(currencies: [kAed, kUsd]);

        final model = CurrencyPickerViewModel();
        await model.loadAllCurrenciesExceptUserAlreadyAdded();

        expect(model.currencies, [kUsd]);
      });
    });
    group('chooseCurrency -', () {
      test(
          'When user choose a currency, Should call the back function and attach the currency abbrivation',
          () async {
        final navigationService = getAndRegisterNavigationService();

        final model = CurrencyPickerViewModel();
        await model.chooseCurrencyAndPop(kUsd.abbrivation);

        verify(navigationService.back(result: kUsd.abbrivation));
      });
    });
  });
}
