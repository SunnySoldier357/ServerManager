import 'package:flutter/material.dart';
import 'package:servermanager/services/wake_on_lan_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:servermanager/app/locator.dart';

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
          child: FlatButton(
            child: Text("Send Wake on LAN Packet"),
            onPressed: () => locator<WakeOnLanService>().sendPacketAsync(),
          ),
        ),
      ),
    );
  }
}
