import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:cm_vendor_app/core/storages/theme_mode_storage.dart';
import 'package:cm_vendor_app/core/theme/theme_config.dart';

import '../core/base/base_view_model.dart';

class ThemeProvider extends BaseViewModel {
  ThemeData get lightTheme => ThemeConfig.light().themeData;
  ThemeData get darkTheme => ThemeConfig.dark().themeData;

  ThemeMode _themeMode = ThemeModeStorage.instance.themeMode;
  ThemeMode get themeMode => _themeMode;

  void toggleThemeMode() async {
    _themeMode = isDarkMode() ? ThemeMode.light : ThemeMode.dark;
    ThemeModeStorage.instance.writeEnum(themeMode);
    notifyListeners();
  }

  void setThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    ThemeModeStorage.instance.writeEnum(themeMode);
    notifyListeners();
  }

  bool isDarkMode() {
    if (themeMode == ThemeMode.system) {
      Brightness? brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }
}
