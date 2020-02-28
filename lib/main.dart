import 'package:flutter/material.dart';

import 'injection_container.dart' as injection;
import 'src/app_widget.dart';

void main() {
  injection.init();
  runApp(AppWidget());
}


