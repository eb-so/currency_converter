import 'package:currency_converter/ui/common/widgets/busy_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_strings.dart';
import '../../common/widgets/currency_card.dart';
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
        appBar: AppBar(
          title: const Text(ksPickNewCurrency),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: model.isBusy
            ? const BusyWidget()
            : ListView.builder(
                itemCount: model.currencies.length,
                itemBuilder: (context, index) {
                  final currencies = model.currencies[index];
                  return CurrencyCard(
                    key: Key('CurrencyCard$index'),
                    onPressed: () =>
                        model.chooseCurrencyAndPop(currencies.abbrivation),
                    currencyAbbrivation: currencies.abbrivation,
                    rate: currencies.name,
                  );
                },
              ),
      ),
    );
  }
}
