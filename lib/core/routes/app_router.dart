import 'package:auto_route/auto_route.dart';
import 'package:vendor_app/core/routes/routers/routers.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route', deferredLoading: false)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => routers;
}
