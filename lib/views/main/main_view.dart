library main_view;

import 'package:auto_route/auto_route.dart';
import 'package:cm_vendor_app/core/base/view_model_provider.dart';
import 'package:cm_vendor_app/views/home/home_view.dart';
import 'package:flutter/material.dart';

import 'main_view_model.dart';

part 'main_adaptive.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MainViewModel>(
      create: (context) => MainViewModel(),
      builder: (context, viewModel, child) {
        return _MainAdaptive(viewModel);
      },
    );
  }
}
