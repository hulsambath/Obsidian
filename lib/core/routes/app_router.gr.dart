// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:cm_vendor_app/views/account/account_view.dart' as _i1;
import 'package:cm_vendor_app/views/bookings/bookings_view.dart' as _i2;
import 'package:cm_vendor_app/views/cart/cart_view.dart' as _i3;
import 'package:cm_vendor_app/views/home/home_view.dart' as _i4;
import 'package:cm_vendor_app/views/main/main_view.dart' as _i5;

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
    BookingsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BookingsView(),
      );
    },
    CartRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainView(),
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
/// [_i2.BookingsView]
class BookingsRoute extends _i6.PageRouteInfo<void> {
  const BookingsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BookingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CartView]
class CartRoute extends _i6.PageRouteInfo<void> {
  const CartRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeView]
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
/// [_i5.MainView]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
