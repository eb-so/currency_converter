import 'package:currency_converter/app/app.locator.dart';
import 'package:currency_converter/app/app.logger.dart';
import 'package:currency_converter/exceptions/http_exception.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/http_service.dart';

import '../constants/api_constants.dart';

typedef Json = Map<String, dynamic>;

abstract class MoneyExchangeApiService {
  Future<List<Currency>> getCurrenciesNamesAndAbbreviations();
  Future<List<Currency>> getCurrenciesExchangeRates(
      List<String> currenciesAbbrivations);
}

class MoneyExchangeApiServiceImp implements MoneyExchangeApiService {
  final _log = getLogger('MoneyExchangeApiServiceImp');
  final _httpService = locator<HttpService>();

  @override
  Future<List<Currency>> getCurrenciesNamesAndAbbreviations() async {
    _log.v('');

    final response = await _httpService.get(kGetAllCurrenciesEndPoint);

    if (response.statusCode == 200) {
      final result = (response.data! as Json)
          .entries
          .map<Currency>((e) => Currency(abbrivation: e.key, name: e.value))
          .toList();

      return result;
    }

    throw HttpException(
        'getCurrenciesNamesAndAbbreviations :${response.statusMessage}');
  }

  @override
  Future<List<Currency>> getCurrenciesExchangeRates(
      List<String> currenciesAbbrivations) async {
    _log.v('currenciesAbbrivations: $currenciesAbbrivations');

    final response = await _httpService.get(
      kGetCurrencyLatestRateEndPoint,
      queryParameters: {'app_id': kAppId},
    );

    if (response.statusCode == 200) {
      return _addRatesToCurrencies(currenciesAbbrivations, response.data!);
    }

    throw HttpException(
        'getCurrenciesExchangeRates :${response.statusMessage}');
  }

  List<Currency> _addRatesToCurrencies(List<String> currencies, Json response) {
    return (response['rates'] as Json)
        .entries
        .where(
          // Rollout the non monitored currencies
          (e) => currencies.contains(e.key),
        )
        .map<Currency>((e) => Currency(abbrivation: e.key, rate: e.value))
        .toList();
  }
}
