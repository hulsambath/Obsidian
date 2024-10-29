import 'package:flutter/material.dart' deferred as material show WidgetsFlutterBinding, runApp;
import 'package:vendor_app/app.dart' deferred as app show App;
import 'package:vendor_app/app_scope.dart' deferred as app_scope show AppScope;
import 'package:vendor_app/initializer.dart' deferred as initializer show Initializer;

void main() async {
  await material.loadLibrary();
  await app.loadLibrary();
  await app_scope.loadLibrary();
  await initializer.loadLibrary();

  material.WidgetsFlutterBinding.ensureInitialized();
  await initializer.Initializer.load();

  material.runApp(
    app_scope.AppScope(builder: (context, router) {
      return app.App(
        appRouter: router,
      );
    }),
  );
}
