library account_screen;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'account_adaptive.dart';

@RoutePage()
class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountAdaptive();
  }
}
