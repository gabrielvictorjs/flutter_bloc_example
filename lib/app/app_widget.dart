import 'package:flutter/material.dart';

import 'routes/routes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.getDynamic,
      routes: AppRoutes.getStatic,
      initialRoute: "home",
    );
  }
}
