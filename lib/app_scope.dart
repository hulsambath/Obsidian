import 'package:cm_vendor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cm_vendor_app/app_localization_loader.dart';
import 'package:cm_vendor_app/provider_scope.dart';
import 'package:cm_vendor_app/core/routes/app_router.dart';

class AppScope extends StatefulWidget {
  static AppRouter get router => _AppScopeState.instance._router;

  const AppScope({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, AppRouter router) builder;

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  _AppScopeState._();

  factory _AppScopeState() => _AppScopeState.instance;
  static final _AppScopeState instance = _AppScopeState._();

  late AppRouter _router;

  @override
  void initState() {
    _router = AppRouter();
    super.initState();
  }

  void restartApp() {
    setState(() {
      _router = AppRouter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        supportedLocales: AppConstants.supportedLocales,
        fallbackLocale: AppConstants.fallbackLocale,
        assetLoader: AppLocalizationLoader(),
        child: widget.builder(context, _router),
      ),
    );
  }
}
