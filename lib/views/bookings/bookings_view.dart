library bookings_view;

import 'package:auto_route/auto_route.dart';
import 'package:cm_vendor_app/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';

import 'bookings_view_model.dart';

part 'bookings_adaptive.dart';

@RoutePage()
class BookingsView extends StatelessWidget {
  const BookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BookingsViewModel>(
      create: (context) => BookingsViewModel(),
      builder: (context, viewModel, child) {
        return _BookingsAdaptive(viewModel);
      },
    );
  }
}
