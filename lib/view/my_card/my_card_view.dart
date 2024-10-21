library my_card_screen;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'my_card_adaptive.dart';

@RoutePage()
class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyCardAdaptive();
  }
}
