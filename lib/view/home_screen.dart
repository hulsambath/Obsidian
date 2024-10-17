import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/provider/theme_provider.dart';

import '../core/routes/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            ElevatedButton(
              onPressed: () {
                context.router.push(
                  CounterRoute(title: 'Counter Page'),
                );
              },
              child: const Text('Go to Counter Screen'),
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
