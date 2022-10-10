// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currency_converter/models/currency.dart' as _i6;
import 'package:currency_converter/ui/views/currency_converter/currency_converter_view.dart'
    as _i4;
import 'package:currency_converter/ui/views/currency_picker/currency_picker_view.dart'
    as _i3;
import 'package:currency_converter/ui/views/landing/landing_view.dart' as _i2;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const landingView = '/landing-view';

  static const currencyPickerView = '/currency-picker-view';

  static const currencyConverterView = '/currency-converter-view';

  static const all = <String>{
    landingView,
    currencyPickerView,
    currencyConverterView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.landingView,
      page: _i2.LandingView,
    ),
    _i1.RouteDef(
      Routes.currencyPickerView,
      page: _i3.CurrencyPickerView,
    ),
    _i1.RouteDef(
      Routes.currencyConverterView,
      page: _i4.CurrencyConverterView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LandingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LandingView(),
        settings: data,
      );
    },
    _i3.CurrencyPickerView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.CurrencyPickerView(),
        settings: data,
      );
    },
    _i4.CurrencyConverterView: (data) {
      final args = data.getArgs<CurrencyConverterViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.CurrencyConverterView(key: args.key, currency: args.currency),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CurrencyConverterViewArguments {
  const CurrencyConverterViewArguments({
    this.key,
    required this.currency,
  });

  final _i5.Key? key;

  final _i6.Currency currency;
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToLandingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.landingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCurrencyPickerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.currencyPickerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCurrencyConverterView({
    _i5.Key? key,
    required _i6.Currency currency,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.currencyConverterView,
        arguments: CurrencyConverterViewArguments(key: key, currency: currency),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
