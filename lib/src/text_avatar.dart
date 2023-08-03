import 'package:acter_avatar/acter_avatar.dart';
import 'package:flutter/material.dart';

ColorMaker defaultColorSet = ColorMaker.pastels();

class TextAvatar extends StatelessWidget {
  final Shape? shape;
  final ColorMaker? colorMaker;
  final ColorGenerator? colorGenerator;
  final double? size;
  final String text;
  final String? sourceText;
  final double? fontSize;
  final int? numberLetters;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final bool? upperCase;

  const TextAvatar({
    Key? key,
    required this.text,
    this.sourceText,
    this.shape,
    this.colorMaker,
    this.colorGenerator,
    this.numberLetters,
    this.size,
    this.fontWeight = FontWeight.bold,
    this.fontFamily,
    this.fontSize,
    this.upperCase = false,
  });

  ColorMaker getColorMaker() {
    if (colorMaker == null) {
      if (colorGenerator != null) {
        return ColorMaker(colorGenerator!);
      } else {
        return defaultColorSet;
      }
    } else {
      return colorMaker!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double finalSize = size ?? 48.0;
    final double fSize = fontSize ?? (finalSize / 3);
    final colors = getColorMaker().generateColorFromString(sourceText ?? text);

    RoundedRectangleBorder _buildTextType() {
      switch (shape) {
        case Shape.Rectangle:
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          );
        case Shape.Circular:
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(finalSize / 2),
          );
        case Shape.None:
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          );
        default:
          {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(finalSize / 2),
            );
          }
      }
    }

    Widget _buildText(ColorSet colors) {
      return Text(
        _textConfiguration(),
        style: TextStyle(
          color: colors.onSurfaceColor,
          fontSize: fSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
      );
    }

    return Container(
      child: Material(
        shape: _buildTextType(),
        color: colors.surfaceColor,
        child: Container(
          height: finalSize,
          width: finalSize,
          child: Center(
            child: _buildText(colors),
          ),
        ),
      ),
    );
  }

  String _toString({String? value}) {
    return String.fromCharCodes(
      value!.runes.toList(),
    );
  }

  String _textConfiguration() {
    var newText = _toString(value: text);
    newText = upperCase! ? newText.toUpperCase() : newText;
    var arrayLetters = newText.trim().split(' ');

    if (arrayLetters.length > 1 && arrayLetters.length == numberLetters) {
      return '${arrayLetters[0][0].trim()}${arrayLetters[1][0].trim()}';
    }

    return '${newText[0]}';
  }
}
