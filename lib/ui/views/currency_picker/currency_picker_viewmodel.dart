import 'package:currency_converter/models/currency.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../services/money_exchange_api_service.dart';
import '../../../services/shared_preferences_service.dart';
import '../../../extensions/list_utils_extension.dart';

class CurrencyPickerViewModel extends BaseViewModel {
  final _log = getLogger('CurrencyPickerViewModel');

  final _moneyExchangeService = locator<MoneyExchangeApiService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _navigationService = locator<NavigationService>();

  List<Currency> currencies = [];

  Future<void> loadAllCurrenciesExceptUserAlreadyAdded() async {
    _log.v('');

    try {
      final fetchedCurrencies = await runBusyFuture(
          _moneyExchangeService.getCurrenciesNamesAndAbbreviations());

      currencies =
          fetchedCurrencies.where(_filterOutAlreadyAddedValues).toList();
    } catch (error) {
      _log.e(error);
      setError(error);
    }
  }

  bool _filterOutAlreadyAddedValues(Currency currency) {
    if (_sharedPreferencesService.myCurrencies.isEmpty) return true;

    return !_sharedPreferencesService.myCurrencies!
        .contains(currency.abbrivation);
  }

  Future<void> chooseCurrencyAndPop(String abbrivation) async {
    _log.v('abbrivation: $abbrivation');

    _sharedPreferencesService.saveNewCurrencyAbbrivation = abbrivation;
    _navigationService.back();
  }
}
