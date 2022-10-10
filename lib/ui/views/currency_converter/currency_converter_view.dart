import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/ui/common/app_strings.dart';
import 'package:currency_converter/ui/common/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'currency_converter_view.form.dart';
import 'currency_converter_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'Quantity',
    initialValue: '1',
    validator: FormValidators.validateUnsignInteger,
  )
])
class CurrencyConverterView extends StatelessWidget
    with $CurrencyConverterView {
  final Currency currency;
  CurrencyConverterView({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrencyConverterViewModel>.reactive(
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.convertToUSD();
      },
      onDispose: (model) => disposeForm(),
      viewModelBuilder: () => CurrencyConverterViewModel(currency),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text(ksCurrencyConverter),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      currency.abbrivation,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextFormField(
                      controller: QuantityController,
                      decoration: InputDecoration(
                          errorStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Theme.of(context).errorColor),
                          errorText: model.quantityValidationMessage),
                    ),
                  ],
                ),
                Text(
                  'TO',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Column(
                  children: [
                    Text(
                      "USD",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      model.result.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
