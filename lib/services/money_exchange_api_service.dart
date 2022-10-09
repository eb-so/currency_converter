import 'package:currency_converter/app/app.locator.dart';
import 'package:currency_converter/app/app.logger.dart';
import 'package:currency_converter/exceptions/http_exception.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/http_service.dart';

import '../constants/api_constants.dart';

typedef Json = Map<String, dynamic>;

abstract class MoneyExchangeApiService {
  Future<List<Currency>> getCurrencies();
  Future<double> getExchangeRateForCurrency(Currency currency);
}

class MoneyExchangeApiServiceImp implements MoneyExchangeApiService {
  final _log = getLogger('MoneyExchangeApiServiceImp');
  final _httpService = locator<HttpService>();

  @override
  Future<List<Currency>> getCurrencies() async {
    _log.v('');

    final response = await _httpService.get(
      '${kOpenExchangeRatesBaseEndPoint}currencies.json',
    );

    if (response.statusCode == 200) {
      final result = (response.data! as Json)
          .entries
          .map<Currency>((e) => Currency(name: e.value, abbrivation: e.key))
          .toList();

      return result;
    }

    throw HttpException('getCurrencies :${response.statusMessage}');
  }

  @override
  Future<double> getExchangeRateForCurrency(Currency currency) async {
    _log.v('currency: $currency');

    final response = await _httpService.get<double>(
      '${kOpenExchangeRatesBaseEndPoint}latest.json',
      queryParameters: {'app_id': kAppId},
    );

    if (response.statusCode == 200) return response.data!;

    throw HttpException(
        'getExchangeRateForCurrency :${response.statusMessage}');
  }
}
