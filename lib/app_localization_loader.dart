import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

class AppLocalizationLoader extends RootBundleAssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    final json = await super.load(path, locale) ?? {};

    Map overriddenKeys = {};
    // switch (locale.toLanguageTag()) {
    //   case 'en':
    //     overriddenKeys = RemoteConfigService.overriddenEnLocalKeys.get();
    //     break;
    //   case 'km':
    //     overriddenKeys = RemoteConfigService.overriddenKmLocalKeys.get();
    //     break;
    // }

    for (final element in overriddenKeys.entries) {
      String key = element.key.toString();
      String value = element.value.toString();
      json[key] = value;
    }

    return json;
  }
}
