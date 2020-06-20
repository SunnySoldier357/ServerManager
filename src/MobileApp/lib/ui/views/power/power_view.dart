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
          body: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                Text(
                  "Server Manager",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.orange,
                          width: 5,
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.all(25),
                        icon: Icon(Icons.power_settings_new),
                        iconSize: 44,
                        onPressed: () async => await vm.turnOnServerAsync(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
