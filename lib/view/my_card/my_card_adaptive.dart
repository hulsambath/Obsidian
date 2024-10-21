part of 'my_card_view.dart';

class MyCardAdaptive extends StatefulWidget {
  const MyCardAdaptive({super.key});

  @override
  State<MyCardAdaptive> createState() => _MyCardAdaptiveState();
}

class _MyCardAdaptiveState extends State<MyCardAdaptive> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('My Card Screen'),
      ),
    );
  }
}
