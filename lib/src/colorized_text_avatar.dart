import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:colorize_text_avatar/src/constants/colors.dart';
import 'package:colorize_text_avatar/src/constants/enums.dart';
import 'package:flutter/material.dart';

class TextAvatar extends StatelessWidget {
  Shape? shape;
  Color? backgroundColor;
  Color? textColor;
  double? size;
  final String? text;
  final double? fontSize;
  final int? numberLetters;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final bool? upperCase;

  TextAvatar(
      {Key? key,
      @required this.text,
      this.textColor,
      this.backgroundColor,
      this.shape,
      this.numberLetters,
      this.size,
      this.fontWeight = FontWeight.bold,
      this.fontFamily,
      this.fontSize = 16,
      this.upperCase = false}) {
    //assert(numberLetters! > 0);
  }

  @override
  Widget build(BuildContext context) {
    shape = (shape == null) ? Shape.Rectangle : shape;
    size = (size == null || size! < 32.0) ? 48.0 : size;
    backgroundColor =
        backgroundColor == null ? _colorBackgroundConfig() : backgroundColor;
    textColor = _colorTextConfig();
    return _textDisplay();
  }

  Color _colorBackgroundConfig() {
    Color? color = colorData[_textConfiguration()[0].toLowerCase().toString()];
    if (color == null) {
      color = buildBackgroundColor();
    }

    return color;
  }

  Color buildBackgroundColor() {
    String newText = text == null ? '?' : _toString(value: text);
    String hexCode = newText
        .toString()
        .codeUnits
        .map((e) => e.toRadixString(16))
        .join()
        .toUpperCase();

    String color = 'FF${hexCode.substring(0, 6)}';

    return Color(int.parse(color, radix: 16));
  }

  Color _colorTextConfig() {
    if (textColor == null)
      return Colors.white;
    else
      return textColor!;
  }

  String _toString({String? value}) {
    return String.fromCharCodes(
      value!.runes.toList(),
    );
  }

  String _textConfiguration() {
    var newText = text == null ? '?' : _toString(value: text);
    newText = upperCase! ? newText.toUpperCase() : newText;
    var arrayLeeters = newText.trim().split(' ');

    if (arrayLeeters.length > 1 && arrayLeeters.length == numberLetters) {
      return '${arrayLeeters[0][0].trim()}${arrayLeeters[1][0].trim()}';
    }

    return '${newText[0]}';
  }

  Widget _buildText() {
    return Text(
      _textConfiguration(),
      style: TextStyle(
        color: textColor,
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

  Widget _textDisplay() {
    return Container(
      child: Material(
        shape: _buildTextType(),
        color: backgroundColor,
        child: Container(
          height: size,
          width: size,
          child: Center(
            child: _buildText(),
          ),
        ),
      ),
    );
  }
}
