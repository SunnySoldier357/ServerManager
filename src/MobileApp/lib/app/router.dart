import 'package:auto_route/auto_route_annotations.dart';

import 'package:servermanager/ui/views/power/power_view.dart';

// To add a new view, add a property below and run the following command
//     flutter pub run build_runner build

@MaterialAutoRouter()
class $Router {
  @initial
  PowerView powerView;
}
