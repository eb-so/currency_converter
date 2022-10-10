import 'package:currency_converter/constants/api_constants.dart';
import 'package:currency_converter/exceptions/http_exception.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/money_exchange_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/constants.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('ExchangeMoneyApiServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('getCurrenciesNamesAndAbbreviations -', () {
      test(
          'When the call succeeded, Should deserialize the incoming data to a List of [Currency] objects',
          () async {
        final mockedHttpService = getAndRegisterHttpService();

        when(mockedHttpService.get(
          kGetAllCurrenciesEndPoint,
        )).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: ''),
              data: kMinimizedCurrenciesSampleJson,
              statusCode: 200,
            ));

        final moneyExchangeApiService = MoneyExchangeApiServiceImp();
        final result =
            await moneyExchangeApiService.getCurrenciesNamesAndAbbreviations();

        expect(result, [
          const Currency(name: 'United Arab Dirham', abbrivation: 'AED'),
          const Currency(name: 'Afghan Afghani', abbrivation: 'AFN'),
          const Currency(name: 'Albanian Lek', abbrivation: 'ALL')
        ]);
      });
      test(
          'When the call failed, Should throw [HttpException] with the suitable message',
          () async {
        final mockedHttpService = getAndRegisterHttpService();

        when(mockedHttpService.get(
          kGetAllCurrenciesEndPoint,
        )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: kMinimizedCurrenciesSampleJson,
            statusCode: 400,
            statusMessage: 'Something went wrong'));

        final moneyExchangeApiService = MoneyExchangeApiServiceImp();

        expect(
            () async => await moneyExchangeApiService
                .getCurrenciesNamesAndAbbreviations(),
            throwsA(isA<HttpException>()));
      });
    });
  });
}
