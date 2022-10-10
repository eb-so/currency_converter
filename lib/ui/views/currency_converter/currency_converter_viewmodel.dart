import 'package:currency_converter/constants/app_logic_constants.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/ui/views/currency_converter/currency_converter_view.form.dart';
import 'package:stacked/stacked.dart';

class CurrencyConverterViewModel extends FormViewModel {
  final Currency currency;
  CurrencyConverterViewModel(this.currency);

  int quantity = 1;
  double result = 0.0;

  void convertToUSD() {
    assert(currency.rate != null);

    final beforeMarkup = quantity * currency.rate!;

    result = (beforeMarkup + beforeMarkup * kMarkupPercentage / 100);
    notifyListeners();
  }

  @override
  void setFormStatus() {
    final newQuantity = int.tryParse(formValueMap[QuantityValueKey]) ?? 1;

    if (newQuantity > 0) {
      quantity = newQuantity;
      convertToUSD();
    }
  }
}
