import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/core/routes/app_router.dart';
import 'package:vendor_app/provider/theme_provider.dart';

class App extends StatelessWidget {
  App({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
