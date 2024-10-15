import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            )
          ],
        ),
      ),
    );
  }
}
