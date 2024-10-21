library bottom_nav_bar;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/view/accout/account_view.dart';
import 'package:vendor_app/view/booking/booking_view.dart';
import 'package:vendor_app/view/home/home_view.dart';
import 'package:vendor_app/view/my_card/my_card_view.dart';

part 'main_adaptive.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainAdaptive();
  }
}
