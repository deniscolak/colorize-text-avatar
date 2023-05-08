import 'package:acter_avatar/acter_avatar.dart';
import 'package:flutter/material.dart';

ColorMaker defaultColorSet = ColorMaker.pastels();

class TextAvatar extends StatelessWidget {
  Shape? shape;
  late ColorMaker colorMaker;
  double? size;
  final String text;
  final String? sourceText;
  final double? fontSize;
  final int? numberLetters;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final bool? upperCase;

  TextAvatar(
      {Key? key,
      required this.text,
      this.sourceText,
      this.shape,
      ColorMaker? colorMaker,
      ColorGenerator? colorGenerator,
      this.numberLetters,
      this.size,
      this.fontWeight = FontWeight.bold,
      this.fontFamily,
      this.fontSize = 16,
      this.upperCase = false}) {
    if (colorMaker == null) {
      if (colorGenerator == null) {
        this.colorMaker = defaultColorSet;
      } else {
        this.colorMaker = ColorMaker(colorGenerator);
      }
    } else {
      this.colorMaker = colorMaker;
    }
  }

  @override
  Widget build(BuildContext context) {
    shape = (shape == null) ? Shape.Rectangle : shape;
    size = (size == null || size! < 32.0) ? 48.0 : size;
    final colors = colorMaker.generateColorFromString(sourceText ?? text);
    return _textDisplay(colors);
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

  Widget _buildText(ColorSet colors) {
    return Text(
      _textConfiguration(),
      style: TextStyle(
        color: colors.onSurfaceColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }

  _buildTextType() {
    switch (shape) {
      case Shape.Rectangle:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        );
      case Shape.Circular:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size! / 2),
        );
      case Shape.None:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        );
      default:
        {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size! / 2),
          );
        }
    }
  }

  Widget _textDisplay(ColorSet colors) {
    return Container(
      child: Material(
        shape: _buildTextType(),
        color: colors.surfaceColor,
        child: Container(
          height: size,
          width: size,
          child: Center(
            child: _buildText(colors),
          ),
        ),
      ),
    );
  }
}
