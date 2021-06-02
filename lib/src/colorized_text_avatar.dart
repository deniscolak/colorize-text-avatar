import 'package:colorize_text_avatar/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TextAvatar extends StatelessWidget {
  const TextAvatar({
    Key? key,
    required this.text,
    this.numberLetters = 2,
    this.upperCase = false,
    TextStyle? style,
    this.width = 48,
    this.height = 48,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.backgroundColor,
  })  : style = style ?? const TextStyle(color: Colors.white),
        super(key: key);

  final String text;
  final int numberLetters;
  final bool upperCase;
  final TextStyle style;

  final BoxShape shape;
  final double? width, height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final String textConfiguration = _textConfiguration();

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: _colorBackgroundConfig(textConfiguration),
        shape: shape,
      ),
      child: Text(textConfiguration, style: style),
    );
  }

  Color? _colorBackgroundConfig(String text) {
    Color? background = backgroundColor;
    if (RegExp(r'[A-Z]|').hasMatch(text)) {
      background = colorData[text[0].toLowerCase().toString()];
    }
    return background;
  }

  String _textConfiguration() {
    String newText = String.fromCharCodes(text.runes.toList());
    newText = upperCase ? newText.toUpperCase() : newText;
    List<String> arrayLetters = newText.trim().split(' ');

    if (arrayLetters.length > 1 && arrayLetters.length == numberLetters) {
      return '${arrayLetters[0][0].trim()}${arrayLetters[1][0].trim()}';
    }

    return '${newText[0]}';
  }
}
