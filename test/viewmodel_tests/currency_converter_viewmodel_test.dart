import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/ui/views/currency_converter/currency_converter_view.form.dart';
import 'package:currency_converter/ui/views/currency_converter/currency_converter_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/app/app.locator.dart';

import '../helpers/constants.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('CurrencyConverterViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('convertToUSD -', () {
      test(
          'When called on AED with quantity of one, Should return the (aed quantity) * 1.5 + (markup percentage)',
          () {
        final model = CurrencyConverterViewModel(kAed);
        model.convertToUSD();

        expect(model.quantity, 1);
        expect(model.result, 1.605);
      });
      test('When change quantity to 2, Should rerun the method again with', () {
        final model = CurrencyConverterViewModel(kAed);
        model.convertToUSD();
        expect(model.result, 1.605);

        model.setData({QuantityValueKey: 2});

        expect(model.result, 1.605 * 2);
      });
    });
  });
}
