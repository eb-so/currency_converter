// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currency_converter/ui/views/currency_picker/currency_picker_view.dart'
    as _i3;
import 'package:currency_converter/ui/views/landing/landing_view.dart' as _i2;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i4;

class Routes {
  static const landingView = '/landing-view';

  static const currencyPickerView = '/currency-picker-view';

  static const all = <String>{
    landingView,
    currencyPickerView,
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
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i4.NavigationService {
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
}
