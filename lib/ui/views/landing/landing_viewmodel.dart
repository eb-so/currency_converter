import 'dart:async';

import 'package:currency_converter/app/app.locator.dart';
import 'package:currency_converter/app/app.logger.dart';
import 'package:currency_converter/app/app.router.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/money_exchange_api_service.dart';
import 'package:currency_converter/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:currency_converter/extensions/list_utils_extension.dart';
import 'package:stacked_services/stacked_services.dart';

class LandingViewModel extends BaseViewModel {
  final _log = getLogger('LandingViewModel');

  final _moneyExchangeService = locator<MoneyExchangeApiService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _navigationService = locator<NavigationService>();

  List<Currency> currencies = [];

  FutureOr<void> loadMyMonitoredCurrencies() async {
    final monitoredCurrencies = _sharedPreferencesService.myCurrencies;
    _log.v('monitoredCurrencies: $monitoredCurrencies');

    // When there is no monitored currencies we don't need to call the api
    if (monitoredCurrencies.isNotNullNorEmpty) {
      try {
        currencies = await runBusyFuture(
          _moneyExchangeService
              .getCurrenciesExchangeRates(monitoredCurrencies!),
        );
        _log.v('currencies: $currencies');
      } catch (error) {
        _log.e(error);
        setError(error);
      }
    }
  }

  void removeCurrency(Currency currency) {
    _log.v('currency: $currency');

    _sharedPreferencesService.removeCurrency = currency.abbrivation;
    currencies.remove(currency);

    notifyListeners();
  }

  Future<void> addNewCurrency() async {
    await _navigationService.navigateTo(Routes.currencyPickerView);
    await loadMyMonitoredCurrencies();
  }

  void navigateToConverterView(Currency currency) {
    _navigationService.navigateTo(
      Routes.currencyConverterView,
      arguments: CurrencyConverterViewArguments(currency: currency),
    );
  }
}
