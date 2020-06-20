// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:servermanager/ui/views/power/power_view.dart';

abstract class Routes {
  static const powerView = '/';
  static const all = {
    powerView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.powerView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => PowerView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
