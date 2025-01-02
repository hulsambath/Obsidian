import 'dart:math' as math;

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:material_color_utilities/material_color_utilities.dart';

class M3Tonal {
  final Color color;
  M3Tonal(this.color) {
    _tonalsCache[color.value] ??= _getTonal();
  }

  TonalPalette get _tonalPalette => _tonalsCache[color.value]!;
  static final Map<int, TonalPalette> _tonalsCache = {};
  final Map<int, Color> _colorsCache = {}; // local cache

  // Reference:
  // package:material_color_utilities/palettes/core_palette.dart
  TonalPalette _getTonal() {
    Cam16 cam = Cam16.fromInt(color.value);
    return TonalPalette.of(cam.hue, math.max(48, cam.chroma));
  }

  Color get(int tonal) {
    return _colorsCache[tonal] ??= Color(_tonalPalette.get(tonal));
  }

  Color get tonal0 => get(0);
  Color get tonal10 => get(10);
  Color get tonal20 => get(20);
  Color get tonal30 => get(30);
  Color get tonal40 => get(40);
  Color get tonal50 => get(50);
  Color get tonal60 => get(60);
  Color get tonal70 => get(70);
  Color get tonal80 => get(80);
  Color get tonal90 => get(90);
  Color get tonal95 => get(95);
  Color get tonal99 => get(99);
  Color get tonal100 => get(100);
}
