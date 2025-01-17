import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cm_vendor_app/providers/theme_provider.dart';
import 'package:cm_vendor_app/core/routes/app_router.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      routerConfig: appRouter.config(),
    );
  }
}
