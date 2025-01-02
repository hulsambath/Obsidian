library m3_color;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/theme/theme_constant.dart';

// export 'package:vendor_app/core/extensions/color_scheme_extension.dart';
part 'package:vendor_app/theme/m3/m3_custom_color.dart';

class M3Color {
  M3Color._();
  static final M3Color instance = M3Color._();

  static ColorScheme of(BuildContext context) => Theme.of(context).colorScheme;
  static Brightness keyboardAppearance(BuildContext context) => Theme.of(context).colorScheme.brightness;
  static bool isDarkMode(BuildContext context) => of(context).brightness == Brightness.dark;

  /// Additonal colors: success, danger, warning, info
  static M3CustomColor bootstrap(BuildContext context) {
    bool darkMode = isDarkMode(context);
    return M3CustomColor.get(darkMode);
  }

  /// Make sure to initialize() on load
  ColorScheme colorScheme(bool isDarkMode) {
    if (isDarkMode) {
      return _darkCache!;
    } else {
      return _lightCache!;
    }
  }

  ColorScheme? _darkCache;
  ColorScheme? _lightCache;

  Future<void> initialize() async {
    // EXPERIMENT DYNAMIC THEME
    Color brandColor = ThemeConstant.brandColor;

    _darkCache = await compute(_generateDarkScheme, brandColor);
    _lightCache = await compute(_generateLightScheme, brandColor);

    _lightCache = _lightCache?.copyWith(
      primary: ThemeConstant.brandColor,
    );

    // most design from Figma is base on light,
    // so we use light color as base for primary colors as well.
    _darkCache = _darkCache?.copyWith(
      primary: ThemeConstant.brandColor,
      onPrimary: _lightCache?.onPrimary,
      primaryContainer: _lightCache?.primaryContainer,
      onPrimaryContainer: _lightCache?.onPrimaryContainer,
    );

    await M3CustomColor._initialize();
  }
}

ColorScheme _generateDarkScheme(Color seedColor) {
  return ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.dark,
  );
}

ColorScheme _generateLightScheme(Color seedColor) {
  return ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.light,
  );
}
