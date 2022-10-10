import 'package:currency_converter/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/widgets/currency_card.dart';
import 'landing_viewmodel.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingViewModel>.reactive(
      onModelReady: (model) => model.loadMyMonitoredCurrencies(),
      viewModelBuilder: () => LandingViewModel(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          title: const Text(ksYourCurrencies),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: model.addNewCurrency, child: const Icon(Icons.add)),
        backgroundColor: Theme.of(context).backgroundColor,
        body: ListView.builder(
          itemCount: model.currencies.length,
          itemBuilder: (context, index) {
            final currency = model.currencies[index];

            return CurrencyCard(
              showRemoveIcon: true,
              onRemove: () => model.removeCurrency(currency),
              onPressed: () => model.navigateToConverterView(currency),
              currencyAbbrivation: currency.abbrivation,
              rate: currency.rate.toString(),
            );
          },
        ),
      ),
    );
  }
}
