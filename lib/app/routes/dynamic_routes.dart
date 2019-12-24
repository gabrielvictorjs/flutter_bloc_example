import 'package:flutter/material.dart';

import '../modules/other/other_module.dart';

Map<String, WidgetBuilder> dynamicRoutes(Object arguments) {
  return {
    "other": (context) => OtherModule(args: arguments),
  };
}
