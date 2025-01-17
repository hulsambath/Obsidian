import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'core/storages/theme_mode_storage.dart';

class Initializer {
  static Future<void> load() async {
    await ThemeModeStorage.instance.initialize();

    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await EasyLocalization.ensureInitialized();

    // licenses
    loadLicenses();
  }

  static void loadLicenses() {
    if (kIsWeb) return;

    LicenseRegistry.addLicense(() async* {
      final kantumruyProLicense = await rootBundle.loadString('assets/fonts/kantumruy_pro/OFL.txt');
      final poppinsLicense = await rootBundle.loadString('assets/fonts/poppins/OFL.txt');

      yield LicenseEntryWithLineBreaks(['KantumruyPro'], kantumruyProLicense);
      yield LicenseEntryWithLineBreaks(['Poppins'], poppinsLicense);
    });
  }

  static String get deviceType {
    if (kIsWeb) return 'web';

    if (Platform.isAndroid) return 'android';
    if (Platform.isFuchsia) return 'fuchsia';
    if (Platform.isIOS) return 'ios';
    if (Platform.isLinux) return 'linux';
    if (Platform.isMacOS) return 'macos';
    if (Platform.isWindows) return 'window';

    return 'default';
  }
}
