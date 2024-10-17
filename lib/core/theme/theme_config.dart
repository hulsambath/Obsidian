import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:vendor_app/constans/config_constant.dart';
// import 'package:vendor_app/core/extensions/color_extension.dart';
import 'package:vendor_app/core/theme/m3/m3_color.dart';
import 'package:vendor_app/core/theme/theme_constant.dart';

class ThemeConfig {
  final bool isDarkMode;

  ThemeConfig(this.isDarkMode);
  ThemeConfig.fromDarkMode(this.isDarkMode);

  // static bool get useWebTheme => false;
  static bool get useWebTheme {
    FlutterView view = PlatformDispatcher.instance.views.first;
    double screenWidth = view.physicalSize.width / view.devicePixelRatio;
    if (screenWidth >= 600) {
      return false;
    } else if (screenWidth < 600) {
      return false;
    } else {
      return foundation.kIsWeb;
    }
  }

  static double webBreakpoint = 1000;

  static EdgeInsets addHorizontalSafePadding({
    required EdgeInsets padding,
    required BuildContext context,
    bool add = false,
  }) {
    double right = padding.right;
    double left = padding.left;

    // if safe area horizontal padding is bigger than actual padding.
    // we don't add safe area padding to actual padding.
    // instead we just use safe area padding.
    if (MediaQuery.of(context).padding.right > right) {
      right = MediaQuery.of(context).padding.right;
    }

    if (MediaQuery.of(context).padding.left > left) {
      left = MediaQuery.of(context).padding.left;
    }

    return EdgeInsets.only(
      top: padding.top,
      left: left,
      bottom: padding.bottom,
      right: right,
    );
  }

  static EdgeInsetsGeometry addSafePadding({
    required EdgeInsetsGeometry padding,
    required BuildContext context,
    required bool top,
    required bool right,
    required bool bottom,
    required bool left,
  }) {
    return padding.add(EdgeInsets.only(
      top: top ? MediaQuery.of(context).padding.top : 0,
      right: right ? MediaQuery.of(context).padding.right : 0,
      bottom: bottom ? MediaQuery.of(context).padding.bottom : 0,
      left: left ? MediaQuery.of(context).padding.left : 0,
    ));
  }

  // adding left & right safe area padding by default.
  // otherwise this left & right padding will make UI behind native UI like status bar or dynamic island
  // on a rotated phone.
  static EdgeInsetsGeometry getPagePadding({
    required double width,
    required EdgeInsetsGeometry fallback,
    required BuildContext context,
    double? webVerticalPadding,
    bool withTopSafeArea = false,
    bool withRightSafeArea = true,
    bool withBottomSafeArea = false,
    bool withLeftSafeArea = true,
  }) {
    if (useWebTheme && width > ThemeConfig.webBreakpoint) {
      return EdgeInsets.symmetric(
        horizontal: (width - ThemeConfig.webBreakpoint) / 2,
        vertical: webVerticalPadding ?? 0.0,
      );
    } else {
      final padding = fallback.resolve(Directionality.of(context));

      double top = padding.top;
      double right = padding.right;
      double bottom = padding.bottom;
      double left = padding.left;

      top = top + (withTopSafeArea ? MediaQuery.of(context).padding.top : 0);
      bottom = bottom + (withBottomSafeArea ? MediaQuery.of(context).padding.bottom : 0);

      // if safe area horizontal padding is bigger than actual padding.
      // we don't add safe area padding to actual padding.
      // instead we just use safe area padding.
      if (withRightSafeArea && MediaQuery.of(context).padding.right > right) {
        right = MediaQuery.of(context).padding.right;
      }

      if (withLeftSafeArea && MediaQuery.of(context).padding.left > left) {
        left = MediaQuery.of(context).padding.left;
      }

      return EdgeInsets.only(
        top: top,
        right: right,
        bottom: bottom,
        left: left,
      );
    }
  }

  factory ThemeConfig.light() {
    return ThemeConfig.fromDarkMode(false);
  }

  factory ThemeConfig.dark() {
    return ThemeConfig.fromDarkMode(true);
  }

  ColorScheme get _light => M3Color.instance.colorScheme(true);
  ColorScheme get _dark => M3Color.instance.colorScheme(false);

  ThemeData get themeData {
    ColorScheme colorScheme = M3Color.instance.colorScheme(isDarkMode);
    TextTheme textTheme = buildTextTheme(colorScheme);

    final themeData = ThemeData(
      // platform: TargetPlatform.android,
      useMaterial3: true,
      applyElevationOverlayColor: true,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      colorScheme: colorScheme,
      // canvasColor: colorScheme.readOnly.surface2,
      switchTheme: buildSwitchTheme(colorScheme),
      radioTheme: buildRadioTheme(colorScheme),
      checkboxTheme: buildCheckboxTheme(colorScheme),
      shadowColor: colorScheme.shadow,
      // dividerColor: getDividerColor(colorScheme),
      // dividerTheme: DividerThemeData(
      //   color: getDividerColor(colorScheme),
      // ),
      appBarTheme: AppBarTheme(
        shadowColor: colorScheme.outline,
        // shadowColor: colorScheme.shadow,
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        centerTitle: false,
        elevation: 0.5,
        scrolledUnderElevation: 0.5,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        enableFeedback: true,
        elevation: 2.0,
        backgroundColor: colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
        extendedPadding: const EdgeInsets.symmetric(horizontal: ConfigConstant.margin2 + 4),
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurface,
        labelStyle: textTheme.titleSmall,
        unselectedLabelStyle: textTheme.titleSmall,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: Colors.transparent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: colorScheme.outline, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        elevation: 0.0,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: _dark.surface),
        actionTextColor: _light.primary,
        shape: RoundedRectangleBorder(
          borderRadius: ConfigConstant.circlarRadius1,
        ),
      ),
      drawerTheme: const DrawerThemeData(shape: RoundedRectangleBorder(), endShape: RoundedRectangleBorder()),
      indicatorColor: colorScheme.onPrimary,
      textTheme: textTheme,
      textButtonTheme: buildTextButtonStyle(colorScheme),
      cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
      ),
    );

    return withDefault(themeData);
  }

  // Color getDividerColor(ColorScheme colorScheme) {
  //   return isDarkMode ? colorScheme.outline.darken(.4) : const Color(0xFFF2F2F2);
  // }

  CheckboxThemeData buildCheckboxTheme(ColorScheme colorScheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) return null;
        if (states.contains(WidgetState.selected)) return colorScheme.primary;
        return null;
      }),
    );
  }

  RadioThemeData buildRadioTheme(ColorScheme colorScheme) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) return null;
        if (states.contains(WidgetState.selected)) return colorScheme.primary;
        return null;
      }),
    );
  }

  SwitchThemeData buildSwitchTheme(ColorScheme colorScheme) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) return null;
        if (states.contains(WidgetState.selected)) return colorScheme.primary;
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) return null;
        if (states.contains(WidgetState.selected)) return colorScheme.primaryContainer;
        return null;
      }),
    );
  }

  TextButtonThemeData buildTextButtonStyle(ColorScheme colorScheme) {
    return const TextButtonThemeData();
  }

  // on build web, please remove poppin from pubspec.yml
  static TextTheme buildTextTheme(ColorScheme colorScheme) {
    // if (kIsWeb) {
    //   return GoogleFonts.poppinsTextTheme(ThemeConstant.defaultTextTheme).apply(
    //     fontFamilyFallback: ThemeConstant.fontFamilyFallback,
    //     bodyColor: colorScheme.onSurface,
    //     displayColor: colorScheme.onSurface,
    //     decorationColor: colorScheme.onSurface,
    //   );
    // } else {
    return ThemeConstant.defaultTextTheme.apply(
      fontFamily: ThemeConstant.defaultFontFamily,
      fontFamilyFallback: ThemeConstant.fontFamilyFallback,
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
      decorationColor: colorScheme.onSurface,
    );
    // }
  }

  static ThemeData withDefault(ThemeData themeData) {
    return themeData.copyWith(
      splashFactory: splashFactory(themeData.platform),
      textTheme: buildTextTheme(themeData.colorScheme),
      textButtonTheme: TextButtonThemeData(
        style: (themeData.textButtonTheme.style ?? const ButtonStyle()).copyWith(
          splashFactory: splashFactory(themeData.platform),
        ),
      ),
    );
  }

  static InteractiveInkFeatureFactory splashFactory(TargetPlatform platform) {
    // InkSparkle.splashFactory,
    // InkRipple.splashFactory,
    // InkSplash.splashFactory,
    // NoSplash.splashFactory
    return isApple(platform) ? NoSplash.splashFactory : InkSparkle.splashFactory;
  }

  static ThemeData minimizedTheme(BuildContext context) {
    return withDefault(
      ThemeData.from(colorScheme: M3Color.of(context)),
    );
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
