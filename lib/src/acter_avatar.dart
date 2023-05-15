import 'package:acter_avatar/acter_avatar.dart';
import 'package:flutter/material.dart';

class ActerAvatar extends StatelessWidget {
  final DisplayMode mode;
  final double? size;
  final String? displayName;
  final String uniqueId;
  final bool showTooltip;
  final ImageProvider<Object>? avatar;
  final Future<ImageProvider<Object>?>? avatarProviderFuture;

  ActerAvatar(
      {Key? key,
      this.displayName,
      required this.uniqueId,
      required this.mode,
      this.showTooltip = true,
      this.avatar,
      this.avatarProviderFuture,
      this.size});

  @override
  Widget build(BuildContext context) {
    if (showTooltip) {
      return Tooltip(
          message: displayName ?? this.uniqueId, child: inner(context));
    }
    return inner(context);
  }

  Widget inner(BuildContext context) {
    if (avatar != null) {
      return renderWithAvatar(context, avatar!);
    } else if (avatarProviderFuture != null) {
      return FutureBuilder<ImageProvider<Object>?>(
          future: avatarProviderFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: size,
                width: size,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              );
            } else if (snapshot.hasData && snapshot.requireData != null) {
              return renderWithAvatar(context, snapshot.data!);
            } else {
              return renderFallback(context);
            }
          });
    } else {
      return renderFallback(context);
    }
  }

  Widget renderWithAvatar(BuildContext context, ImageProvider avatar) {
    /// Fallback
    switch (mode) {
      case DisplayMode.User:
      case DisplayMode.DM:
        // User fallback mode
        return CircleAvatar(
          foregroundImage: avatar,
          radius: (size! / 2.0),
        );
      case DisplayMode.Space:
      case DisplayMode.GroupChat:
        return Container(
          height: size,
          width: size,
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Image(
              image: avatar,
            ),
          ),
        );
    }
  }

  Widget renderFallback(BuildContext context) {
    /// Fallback
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
