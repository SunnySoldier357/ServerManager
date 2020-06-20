import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:servermanager/ui/views/power/power_view_model.dart';

class PowerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PowerViewModel>.reactive(
      viewModelBuilder: () => PowerViewModel(),
      builder: (_, vm, __) {
        return Scaffold(
          body: Center(
            child: FlatButton(
              child: Text("Send Wake on LAN Packet"),
              onPressed: () async => await vm.turnOnServerAsync(),
            ),
          ),
        );
      },
    );
  }
}
