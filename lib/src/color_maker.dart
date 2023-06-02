import 'package:flutter/material.dart';

// inspired by [Spencer Stolworthy's](https://github.com/sdstolworthy)
// [hashbrown](https://github.com/getformative/ColorMaker)

/// A [ColorGenerator] generates a colorset based on a seed integer. Given equal seed integers, the ColorSet should also be the same.
typedef ColorGenerator = ColorSet Function(int);

Color _simpleColor(int hash) {
  String c = (hash & 0x00FFFFFF).toRadixString(16).toUpperCase();
  String hex = "FF00000".substring(0, 8 - c.length) + c;
  return Color(int.parse(hex, radix: 16));
}

ColorSet _simpleGenerator(int hash) {
  final surfaceColor = _simpleColor(hash);
  final textColor = _textColor(surfaceColor);
  return ColorSet(surfaceColor, textColor);
}

ColorSet _pastelGenerator(int hash) {
  final surfaceColor = HSLColor.fromColor(_simpleColor(hash));
  final pasteledColor =
      surfaceColor.withSaturation(0.45).withLightness(0.85).toColor();
  final textColor = _textColor(pasteledColor);
  return ColorSet(pasteledColor, textColor);
}

ColorSet _boldGenerator(int hash) {
  final surfaceColor = HSLColor.fromColor(_simpleColor(hash));
  final boldedColor =
      surfaceColor.withSaturation(0.85).withLightness(0.45).toColor();
  final textColor = _textColor(boldedColor);
  // we swap for bolder coloring
  return ColorSet(boldedColor, textColor);
}

Color _textColor(Color surfaceColor, {double luminanceThreshold = 0.5}) {
  if (surfaceColor.computeLuminance() > luminanceThreshold) {
    final hsl = HSLColor.fromColor(surfaceColor);
    final lightnessSubtractor = (hsl.lightness * 0.4).clamp(0.35, 0.6);
    final color = hsl
        .withLightness((hsl.lightness - lightnessSubtractor).clamp(0.0, 1.0))
        .toColor();
    return color;
  }
  return const Color.fromRGBO(255, 255, 255, 1);
}

/// A combination of a surface color and onSurface color.
/// The surface color can appropriately be used as a background color,
/// and the onSurface color can be used as a text color.
class ColorSet {
  ColorSet(this.surfaceColor, this.onSurfaceColor);
  Color surfaceColor;
  Color onSurfaceColor;
  @override
  String toString() =>
      'surfaceColor: $surfaceColor; onSurfaceColor: $onSurfaceColor';

  @override
  int get hashCode =>
      surfaceColor.value.hashCode ^ onSurfaceColor.value.hashCode;

  @override
  operator ==(covariant other) =>
      other is ColorSet &&
      other.surfaceColor.value == surfaceColor.value &&
      other.onSurfaceColor.value == surfaceColor.value;
}

/// The Hashbrown class provides a generateColor method.
/// The Hashbrown accepts as a constructor parameter a [ColorGenerator], which can be used to customize the color generation behavior of the library.
/// By default, Hashbrown includes two color generation strategies, `pastels` and `bold`.
/// The hashbrown class provides factories to access these generators: `Hashbrown.pastels()` and `Hashbrown.bold()`
class ColorMaker {
  ColorGenerator _colorGenerator;

  /// `ColorMaker.simple()` creates an instance of [ColorMaker] that produces vibrant surface colors and a contrasting text color
  factory ColorMaker.simple() {
    return ColorMaker(_simpleGenerator);
  }

  /// `ColorMaker.bold()` creates an instance of [ColorMaker] that produces vibrant surface colors and a contrasting text color
  factory ColorMaker.bold() {
    return ColorMaker(_boldGenerator);
  }

  /// `ColorMaker.pastels()` factory instantiates a [ColorMaker] class with a pastel color generator.
  /// This will create a background color with a high luminance, and a darker shade foreground color.
  factory ColorMaker.pastels() {
    return ColorMaker(_pastelGenerator);
  }

  /// `generateColor` takes a hashcode (or any other integer) as a parameter and generates a [ColorSet].
  // ColorSet generateColor(int hashcode) {
  //   return _colorGenerator(hashCode);
  // }

  /// helper to `generateColor` for string. generates a [ColorSet].
  ColorSet generateColorFromString(String source) {
    return _colorGenerator(source.hashCode);
  }

  ColorMaker(this._colorGenerator);
}
