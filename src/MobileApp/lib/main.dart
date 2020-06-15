import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:servermanager/app/locator.dart';
import 'package:servermanager/models/app_settings.dart';

void main() {
  initLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: locator.isReady<AppSettings>(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return Text(locator<AppSettings>().testString);

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
