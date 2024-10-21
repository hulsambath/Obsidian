library booking_screen;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'booking_adaptive.dart';

@RoutePage()
class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BookingAdaptive();
  }
}
