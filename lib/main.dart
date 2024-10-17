import 'package:flutter/material.dart' deferred as material show WidgetsFlutterBinding, runApp;
import 'package:vendor_app/app.dart';
import 'package:vendor_app/provider_scope.dart';

import 'initializer.dart' as initializer;

void main() async {
  await material.loadLibrary();

  material.WidgetsFlutterBinding.ensureInitialized();
  await initializer.Initializer.load();

  material.runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
