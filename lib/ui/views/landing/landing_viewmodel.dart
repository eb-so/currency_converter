import 'dart:async';

import 'package:currency_converter/app/app.locator.dart';
import 'package:currency_converter/app/app.logger.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/money_exchange_api_service.dart';
import 'package:currency_converter/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:currency_converter/extensions/list_utils_extension.dart';

class LandingViewModel extends BaseViewModel {
  final _log = getLogger('LandingViewModel');

  final _moneyExchangeService = locator<MoneyExchangeApiService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  List<Currency> currencies = [];

  FutureOr<void> loadMyMonitoredCurrencies() async {
    _log.v('');

    // When there is no monitored currencies we don't need to call the api
    if (_sharedPreferencesService.myCurrencies.isNotNullNorEmpty) {
      try {
        currencies = await runBusyFuture(
          _moneyExchangeService.getCurrenciesExchangeRates(
              _sharedPreferencesService.myCurrencies!),
        );
        _log.v(currencies);
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
  }
}
