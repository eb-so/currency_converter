import 'package:currency_converter/services/http_service.dart';
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
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterMoneyExchangeApiService();
  getAndRegisterHttpService();
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
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockMoneyExchangeApiService getAndRegisterMoneyExchangeApiService() {
  _removeRegistrationIfExists<MoneyExchangeApiService>();
  final service = MockMoneyExchangeApiService();
  locator.registerSingleton<MoneyExchangeApiService>(service);
  return service;
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
