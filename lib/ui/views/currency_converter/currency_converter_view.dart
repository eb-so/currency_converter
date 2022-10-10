import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/ui/common/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'currency_converter_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'Quantity',
    initialValue: '1',
    validator: FormValidators.validateUnsignInteger,
  )
])
class CurrencyConverterView extends StatelessWidget {
  final Currency currency;
  const CurrencyConverterView({Key? key, required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrencyConverterViewModel>.reactive(
      onModelReady: (model) => model.convertToUSD(),
      viewModelBuilder: () => CurrencyConverterViewModel(currency),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
