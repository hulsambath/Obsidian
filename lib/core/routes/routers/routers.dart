import 'package:auto_route/auto_route.dart';
import 'package:vendor_app/core/routes/app_router.dart';

final routers = [
  AutoRoute(page: HomeRoute.page, initial: true),
  AutoRoute(page: CounterRoute.page),
];
