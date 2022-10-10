import 'package:shared_preferences/shared_preferences.dart';

import '../app/app.logger.dart';

const _MonitoredCurrenciesKey = 'monitoredCurrencies';

class SharedPreferencesService {
  final _log = getLogger('SharedPreferencesService');
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  static Future<SharedPreferencesService> getInstance(
      {bool enableLogs = false}) async {
    _instance ??= SharedPreferencesService();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  List<String>? get myCurrencies =>
      _preferences.getStringList(_MonitoredCurrenciesKey);

  set saveNewCurrencyAbbrivation(String currencyAbbreviation) {
    _log.v('currencyAbbreviation: $currencyAbbreviation');
    // When this is the first value to add
    if (myCurrencies == null) {
      _preferences
          .setStringList(_MonitoredCurrenciesKey, [currencyAbbreviation]);
    } else {
      _preferences.setStringList(
          _MonitoredCurrenciesKey, [...myCurrencies!, currencyAbbreviation]);
    }
  }

  set removeCurrency(String currencyAbbreviation) {
    _log.v('currencyAbbreviation: $currencyAbbreviation');
    final tempList = myCurrencies;

    if (tempList == null || tempList.isEmpty) return;

    if (tempList.remove(currencyAbbreviation)) {
      _preferences.setStringList(_MonitoredCurrenciesKey, tempList);
    } else {
      // If the value is not found do nothing
    }
  }

  void clearMemory() {
    _preferences.clear();
  }
}
