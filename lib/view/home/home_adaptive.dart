part of 'home_view.dart';

class HomeAdaptive extends StatefulWidget {
  const HomeAdaptive({super.key});

  @override
  State<HomeAdaptive> createState() => _HomeAdaptiveState();
}

class _HomeAdaptiveState extends State<HomeAdaptive> {
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Home Page',
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 12,
            ),
            FilledButton.icon(
              onPressed: () {
                setState(() {
                  dark = !dark;
                });
                context.read<ThemeProvider>().toggleThemeMode();
              },
              label: dark ? const Text('Dark Mode') : const Text('Light Mode'),
              icon: dark ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
            )
          ],
        ),
      ),
    );
  }
}
