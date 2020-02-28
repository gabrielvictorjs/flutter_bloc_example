import 'package:flutter/material.dart';

import 'routes/routes.gr.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: "/",
    );
  }
}