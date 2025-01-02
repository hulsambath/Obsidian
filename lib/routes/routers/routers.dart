import 'package:auto_route/auto_route.dart';
import 'package:vendor_app/routes/app_router.gr.dart';

part 'account_router.dart';
part 'booking_router.dart';
part 'home_router.dart';
part 'my_card_router.dart';

final routers = [
  AutoRoute(
    path: '/',
    page: MainRoute.page,
    children: [
      _home,
      _booking,
      _mycard,
      _account,
    ],
  ),
];
