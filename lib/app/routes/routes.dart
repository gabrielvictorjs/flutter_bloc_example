import 'package:flutter/material.dart';

import 'dynamic_routes.dart';
import 'static_routes.dart';

class AppRoutes {
  static Route<dynamic> getDynamic(RouteSettings settings) {
    final routes = dynamicRoutes(settings.arguments);
    return MaterialPageRoute(builder: routes[settings.name]);
  }

  static Map<String, WidgetBuilder> get getStatic {
    return staticRoutes();
  }
}
