import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:currency_converter/ui/views/landing/landing_view.dart';

import '../services/http_service.dart';
import '../services/money_exchange_api_service.dart';
import '../services/shared_preferences_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LandingView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HttpService),
    LazySingleton(
      classType: MoneyExchangeApiServiceImp,
      asType: MoneyExchangeApiService,
    ),
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class App {}
