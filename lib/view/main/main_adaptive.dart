part of 'main_view.dart';

class MainAdaptive extends StatefulWidget {
  const MainAdaptive({super.key});

  @override
  State<MainAdaptive> createState() => _MainAdaptiveState();
}

class _MainAdaptiveState extends State<MainAdaptive> {
  int currentIndex = 0;
  bool dark = false;

  List<Widget> page = [const HomeView(), const BookingView(), const MyCardView(), const AccountView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 0.5,
        selectedIndex: currentIndex,
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.backpack),
            label: 'Booking',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'My Card',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Account',
          ),
        ],
      ),
      body: page[currentIndex],
    );
  }
}
