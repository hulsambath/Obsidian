import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Global {
  static final Global instance = Global._();
  Global._();

  // GLOBAL VARs
  PackageInfo? _platform;

  Future<void> initialize() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // ACCESSIBLE
  bool get unitTesting => Platform.environment.containsKey('FLUTTER_TEST');
  PackageInfo get platform {
    if (unitTesting) {
      return PackageInfo(
        appName: 'unit-test',
        packageName: 'test.unit.com',
        version: '1.0.0',
        buildNumber: '1',
      );
    }

    if (_platform == null) throw ErrorSummary('Required initialize [Global] in main()');
    return _platform!;
  }
}
