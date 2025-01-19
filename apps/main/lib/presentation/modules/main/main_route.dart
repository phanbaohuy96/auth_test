import 'package:flutter/material.dart';

import 'dashboard/dashboard_screen.dart';

class MainRoute {
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        DashboardScreen.routeName: (context) {
          return DashboardScreen();
        },
      };
}
