part of 'booking_view.dart';

class BookingAdaptive extends StatefulWidget {
  const BookingAdaptive({super.key});

  @override
  State<BookingAdaptive> createState() => _BookingAdaptiveState();
}

class _BookingAdaptiveState extends State<BookingAdaptive> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Booking Screen'),
      ),
    );
  }
}
