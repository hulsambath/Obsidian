// ignore_for_file: constant_identifier_names

// TODO: add missing envs that does not have in [configs].json
enum ApiConstant {
  APP_NAME,
  APP_SCHEME,
  API_URL,
  CLIENT_ID,
  CLIENT_SECRET;

  static final String appName = APP_NAME.value;
  static final String appScheme = APP_SCHEME.value;
  static final String apiUrl = API_URL.value;
  static final String clientSecret = CLIENT_ID.value;
  static final String clientId = CLIENT_SECRET.value;

  String get value {
    // fromEnvironment only allow const, so we have to manually getting value with switch case.
    switch (this) {
      case APP_NAME:
        return const String.fromEnvironment('APP_NAME');
      case APP_SCHEME:
        return const String.fromEnvironment('APP_SCHEME');
      case API_URL:
        return const String.fromEnvironment('API_URL');
      case CLIENT_ID:
        return const String.fromEnvironment('CLIENT_ID');
      case CLIENT_SECRET:
        return const String.fromEnvironment('CLIENT_SECRET');
    }
  }
}
