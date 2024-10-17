import 'package:flutter/material.dart';
import 'package:vendor_app/provider_scope.dart';

class AppScope extends StatefulWidget {
  const AppScope({super.key, required this.builder});

  final Widget Function(BuildContext context) builder;

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  _AppScopeState._();

  factory _AppScopeState() => _AppScopeState.instance;
  static final _AppScopeState instance = _AppScopeState._();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: widget.builder(context),
    );
  }
}
