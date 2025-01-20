import 'package:cm_vendor_app/core/extensions/color_scheme_extensions.dart';
import 'package:cm_vendor_app/core/theme/theme_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  final bool isDarkMode;

  ThemeConfig(this.isDarkMode);
  ThemeConfig.fromDarkMode(this.isDarkMode);

  final lightScheme = ColorScheme.fromSeed(
    seedColor: ThemeConstant.brandColor,
    brightness: Brightness.light,
  ).copyWith(
    primary: ThemeConstant.brandColor,
  );
  final darkScheme = ColorScheme.fromSeed(
    seedColor: ThemeConstant.brandColor,
    brightness: Brightness.dark,
  ).copyWith(
    primary: ThemeConstant.brandColor,
  );

  factory ThemeConfig.light() {
    return ThemeConfig.fromDarkMode(false);
  }

  factory ThemeConfig.dark() {
    return ThemeConfig.fromDarkMode(true);
  }

  ThemeData get themeData {
    ThemeData themeData = isDarkMode ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true);
    ColorScheme colorScheme = isDarkMode ? darkScheme : lightScheme;

    TargetPlatform platform = defaultTargetPlatform;

    return themeData.copyWith(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      primaryColorDark: darkScheme.primaryContainer,
      primaryColorLight: lightScheme.primaryContainer,
      canvasColor: colorScheme.readOnly.surface1,
      scaffoldBackgroundColor: colorScheme.surface,
      colorScheme: colorScheme,
      platform: platform,
      splashFactory: splashFactory(platform),
      textTheme: buildTextTheme(colorScheme),
      textButtonTheme: TextButtonThemeData(
        style: (themeData.textButtonTheme.style ?? const ButtonStyle()).copyWith(
          splashFactory: splashFactory(themeData.platform),
        ),
      ),
    );
  }

  static TextTheme buildTextTheme(ColorScheme colorScheme) {
    return ThemeConstant.defaultTextTheme.apply(
      fontFamily: ThemeConstant.defaultFontFamily,
      fontFamilyFallback: ThemeConstant.fontFamilyFallback,
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
      decorationColor: colorScheme.onSurface,
    );
  }

  static InteractiveInkFeatureFactory splashFactory(TargetPlatform platform) {
    return isApple(platform) ? NoSplash.splashFactory : InkSparkle.splashFactory;
  }

  static bool isApple(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return true;
    }
  }
}
