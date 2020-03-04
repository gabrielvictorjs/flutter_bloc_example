// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:features_testing/src/pages/home_page.dart';
import 'package:features_testing/src/pages/reorderable_page.dart';
import 'package:features_testing/src/pages/dio_posts_page.dart';

class Routes {
  static const home = '/';
  static const reorderable = '/reorderable';
  static const dioPosts = '/dio-posts';
  static const _guardedRoutes = const {};
  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomePage(),
          settings: settings,
        );
      case Routes.reorderable:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ReorderablePage(),
          settings: settings,
        );
      case Routes.dioPosts:
        return MaterialPageRoute<dynamic>(
          builder: (_) => DioPostsPage(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
