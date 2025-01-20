library home_screen;

import 'package:auto_route/auto_route.dart';
import 'package:cm_vendor_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'home_adaptive.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeAdaptive();
  }
}
