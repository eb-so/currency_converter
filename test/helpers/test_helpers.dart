import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/http_service.dart';
import 'package:currency_converter/services/shared_preferences_service.dart';
import 'package:mockito/annotations.dart';
import 'package:currency_converter/app/app.locator.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:currency_converter/services/money_exchange_api_service.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(),
  MockSpec<MoneyExchangeApiService>(),
  MockSpec<HttpService>(),
  MockSpec<SharedPreferencesService>(),
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterMoneyExchangeApiService();
  getAndRegisterHttpService();
  getAndRegisterSharedPreferencesService();
}

HttpService getAndRegisterHttpService() {
  _removeRegistrationIfExists<HttpService>();
  final service = MockHttpService();
  locator.registerSingleton<HttpService>(service);
  return service;
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  when(service.back(result: anyNamed('result'), id: anyNamed('id')))
      .thenReturn(false);
  when(service.navigateTo(any)).thenAnswer((_) => Future.value());
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockMoneyExchangeApiService getAndRegisterMoneyExchangeApiService({
  List<Currency> currencies = const [],
}) {
  _removeRegistrationIfExists<MoneyExchangeApiService>();
  final service = MockMoneyExchangeApiService();
  when(service.getCurrenciesNamesAndAbbreviations())
      .thenAnswer((realInvocation) => Future.value(currencies));
  when(service.getCurrenciesExchangeRates(any))
      .thenAnswer((realInvocation) => Future.value(currencies));
  locator.registerSingleton<MoneyExchangeApiService>(service);
  return service;
}

SharedPreferencesService getAndRegisterSharedPreferencesService(
    {List<String> myCurrencies = const []}) {
  _removeRegistrationIfExists<SharedPreferencesService>();
  final service = MockSharedPreferencesService();
  when(service.myCurrencies).thenReturn(myCurrencies);
  locator.registerSingleton<SharedPreferencesService>(service);
  return service;
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
