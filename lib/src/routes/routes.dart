import 'package:auto_route/auto_route_annotations.dart';

import '../pages/home_page.dart';

@MaterialAutoRouter()
class $Routes {
  @initial
  HomePage homePage;
}