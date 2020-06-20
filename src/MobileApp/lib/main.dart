import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:servermanager/app/locator.dart';
import 'package:servermanager/app/router.gr.dart';

void main() {
  initLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.powerView,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
