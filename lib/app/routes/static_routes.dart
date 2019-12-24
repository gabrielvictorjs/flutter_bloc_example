import 'package:flutter/material.dart';

import '../modules/home/home_module.dart';

Map<String, WidgetBuilder> staticRoutes() {
  return {
    "home": (context) => HomeModule(),
  };
}
