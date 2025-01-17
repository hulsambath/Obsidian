library account_view;

import 'package:auto_route/auto_route.dart';
import 'package:cm_vendor_app/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'account_view_model.dart';

part 'account_adaptive.dart';

@RoutePage()
class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AccountViewModel>(
      create: (context) => AccountViewModel(),
      builder: (context, viewModel, child) {
        return _AccountAdaptive(viewModel);
      },
    );
  }
}
