// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      final args = routeData.argsAs<CounterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CounterScreen(
          key: args.key,
          title: args.title,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [CounterScreen]
class CounterRoute extends PageRouteInfo<CounterRouteArgs> {
  CounterRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          CounterRoute.name,
          args: CounterRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const PageInfo<CounterRouteArgs> page =
      PageInfo<CounterRouteArgs>(name);
}

class CounterRouteArgs {
  const CounterRouteArgs({
    this.key,
    required this.title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'CounterRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
