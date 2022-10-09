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
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
