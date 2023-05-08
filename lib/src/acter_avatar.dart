import 'package:acter_avatar/acter_avatar.dart';
import 'package:flutter/material.dart';

class ActerAvatar extends StatelessWidget {
  final DisplayMode mode;
  final double? size;
  final String? displayName;
  final String uniqueId;

  ActerAvatar(
      {Key? key,
      this.displayName,
      required this.uniqueId,
      required this.mode,
      this.size});

  @override
  Widget build(BuildContext context) {
    switch (mode) {
      case DisplayMode.User:
        // User fallback mode
        return MultiAvatar(
          uniqueId: uniqueId,
          size: size,
        );
      case DisplayMode.Space:
        return TextAvatar(
          text: displayName ?? uniqueId,
          sourceText: uniqueId,
          size: size,
          shape: Shape.Rectangle,
        );

      case DisplayMode.GroupChat:
        // FIXME: add support for groupchat style
        return SizedBox(
          height: size,
          width: size,
        );

      case DisplayMode.DM:
        // FIXME: add support for dm style
        return SizedBox(
          height: size,
          width: size,
        );
    }
  }
}
