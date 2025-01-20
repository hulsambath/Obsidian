import 'package:auto_route/auto_route.dart';
import 'package:cm_vendor_app/core/routes/app_router.gr.dart';

final routers = [
  AutoRoute(
    path: '/',
    page: MainRoute.page,
    children: [
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: BookingsRoute.page),
      AutoRoute(page: CartRoute.page),
      AutoRoute(page: AccountRoute.page),
    ],
  ),
];
