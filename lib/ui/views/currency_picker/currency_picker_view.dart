import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'currency_picker_viewmodel.dart';

class CurrencyPickerView extends StatelessWidget {
  const CurrencyPickerView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrencyPickerViewModel>.reactive(
      onModelReady: (model) => model.loadAllCurrenciesExceptUserAlreadyAdded(),
      viewModelBuilder: () => CurrencyPickerViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
