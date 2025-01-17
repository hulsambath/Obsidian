library cart_view;

import 'package:auto_route/auto_route.dart';
import 'package:cm_vendor_app/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'cart_view_model.dart';

part 'cart_adaptive.dart';

@RoutePage()
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CartViewModel>(
      create: (context) => CartViewModel(),
      builder: (context, viewModel, child) {
        return _CartAdaptive(viewModel);
      },
    );
  }
}
