import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/routes/routers/routers.dart';
import 'package:vendor_app/view/counter_screen.dart';
import 'package:vendor_app/view/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => routers;
}
