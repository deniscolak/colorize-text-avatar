import 'package:flutter/material.dart';
import 'dart:ui';

enum Shape { Rectangle, Circular, None }

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
    backgroundColor = _colorBackgroundConfig();
    textColor = _colorTextConfig();
    return _textDisplay();
  }

  Color _colorBackgroundConfig() {
    if (RegExp(r'[A-Z]|').hasMatch(
      _textConfiguration(),
    )) {
      backgroundColor =
          colorData[_textConfiguration()[0].toLowerCase().toString()];
    }
    return backgroundColor!;
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

var colorData = {
  "a": Color.fromRGBO(226, 95, 81, 1),
  "b": Color.fromRGBO(242, 96, 145, 1),
  "c": Color.fromRGBO(187, 101, 202, 1),
  "d": Color.fromRGBO(149, 114, 207, 1),
  "e": Color.fromRGBO(120, 132, 205, 1),
  "f": Color.fromRGBO(91, 149, 249, 1),
  "g": Color.fromRGBO(72, 194, 249, 1),
  "h": Color.fromRGBO(69, 208, 226, 1),
  "i": Color.fromRGBO(38, 166, 154, 1),
  "j": Color.fromRGBO(82, 188, 137, 1),
  "k": Color.fromRGBO(155, 206, 95, 1),
  "l": Color.fromRGBO(212, 227, 74, 1),
  "m": Color.fromRGBO(254, 218, 16, 1),
  "n": Color.fromRGBO(247, 192, 0, 1),
  "o": Color.fromRGBO(255, 168, 0, 1),
  "p": Color.fromRGBO(255, 138, 96, 1),
  "q": Color.fromRGBO(194, 194, 194, 1),
  "r": Color.fromRGBO(143, 164, 175, 1),
  "s": Color.fromRGBO(162, 136, 126, 1),
  "t": Color.fromRGBO(163, 163, 163, 1),
  "u": Color.fromRGBO(175, 181, 226, 1),
  "v": Color.fromRGBO(179, 155, 221, 1),
  "w": Color.fromRGBO(194, 194, 194, 1),
  "x": Color.fromRGBO(124, 222, 235, 1),
  "y": Color.fromRGBO(188, 170, 164, 1),
  "z": Color.fromRGBO(173, 214, 125, 1),
};
