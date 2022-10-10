import 'package:currency_converter/services/shared_preferences_service.dart';
import 'package:currency_converter/ui/common/app_strings.dart';
import 'package:currency_converter/ui/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/app/app.locator.dart';

import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ksAppTitle,
      theme: myTheme,
      initialRoute: Routes.landingView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
