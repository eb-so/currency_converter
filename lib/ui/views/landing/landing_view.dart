import 'package:currency_converter/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: const [],
        ),
      ),
    );
  }
}
