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

  set saveNewCurrency(String currencyAbbreviation) {
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
    if (myCurrencies == null || myCurrencies!.isEmpty) return;

    if (myCurrencies!.contains(currencyAbbreviation)) {
      _preferences
          .setStringList(_MonitoredCurrenciesKey, [currencyAbbreviation]);
    } else {
      // If the value is not found do nothing
    }
  }

  void saveToDisk(String key, dynamic content) {
    _log.v('key:$key value:$content');

    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}
