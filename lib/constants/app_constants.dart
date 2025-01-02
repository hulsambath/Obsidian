import 'dart:ui';

class AppConstants {
  AppConstants._internal();
  static const String appName = String.fromEnvironment('APP_NAME');
  static const String appSceme = String.fromEnvironment('APP_SCHEME');
  static const String clientID = String.fromEnvironment('CLIENT_ID');
  static const String clientSecret = String.fromEnvironment('CLIENT_SECRET');
  static const String appUrl = String.fromEnvironment('API_URL');

  static const Locale fallbackLocale = Locale('en', 'US');

  static const supportedLocales = [
    Locale('en'),
    Locale('km'),
  ];
}
