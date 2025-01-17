// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:cm_vendor_app/view/accout/account_view.dart' as _i1;
import 'package:cm_vendor_app/view/booking/booking_view.dart' as _i2;
import 'package:cm_vendor_app/view/home/home_view.dart' as _i3;
import 'package:cm_vendor_app/view/main/main_view.dart' as _i4;
import 'package:cm_vendor_app/view/my_card/my_card_view.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountView(),
      );
    },
    BookingRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BookingView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainView(),
      );
    },
    MyCardRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MyCardView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountView]
class AccountRoute extends _i6.PageRouteInfo<void> {
  const AccountRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BookingView]
class BookingRoute extends _i6.PageRouteInfo<void> {
  const BookingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainView]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MyCardView]
class MyCardRoute extends _i6.PageRouteInfo<void> {
  const MyCardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MyCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCardRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
