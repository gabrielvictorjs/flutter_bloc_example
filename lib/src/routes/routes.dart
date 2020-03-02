import 'package:auto_route/auto_route_annotations.dart';
import 'package:features_testing/src/pages/reorderable_page.dart';

import '../pages/home_page.dart';

@MaterialAutoRouter()
class $Routes {
  @initial
  HomePage home;
  ReorderablePage reorderable;
}