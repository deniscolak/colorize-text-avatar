import 'package:acter_avatar/acter_avatar.dart';
import 'package:flutter/material.dart';

class ActerAvatar extends StatefulWidget {
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
      this.size})
      : super(key: key);

  @override
  _ActerAvatar createState() => _ActerAvatar();
}

class _ActerAvatar extends State<ActerAvatar> {
  ImageProvider<Object>? _avatar;

  // avoid re-run future when object state isn't changed.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setAvatar();
  }

  void setAvatar() async {
    if (widget.avatar != null) {
      // hasAvatar == false
      setState(() {
        _avatar = widget.avatar;
      });
    } else if (widget.avatarProviderFuture != null) {
      final avatar = await widget.avatarProviderFuture;
      setState(() {
        _avatar = avatar;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showTooltip) {
      return Tooltip(
          message: widget.displayName ?? widget.uniqueId,
          child: inner(context));
    }
    return inner(context);
  }

  Widget inner(BuildContext context) {
    if (_avatar != null) {
      return renderWithAvatar(context, _avatar!);
    } else {
      return renderFallback(context);
    }
  }

  Widget renderWithAvatar(BuildContext context, ImageProvider avatar) {
    /// Fallback
    switch (widget.mode) {
      case DisplayMode.User:
      case DisplayMode.DM:
        // User fallback mode
        return CircleAvatar(
          foregroundImage: avatar,
          radius: widget.size,
        );
      case DisplayMode.Space:
      case DisplayMode.GroupChat:
        return Container(
          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ResizeImage(
                avatar,
                width: widget.size!.toInt(),
                height: widget.size!.toInt(),
              ),
            ),
          ),
        );
    }
  }

  Widget renderFallback(BuildContext context) {
    /// Fallback
    switch (widget.mode) {
      case DisplayMode.User:
        // User fallback mode
        return MultiAvatar(
          uniqueId: widget.uniqueId,
          size: widget.size! * 2,
        );
      case DisplayMode.Space:
        return TextAvatar(
          text: widget.displayName ?? widget.uniqueId,
          sourceText: widget.uniqueId,
          size: widget.size,
          shape: Shape.Rectangle,
        );

      case DisplayMode.GroupChat:
        // FIXME: add support for groupchat style
        return SizedBox(
          height: widget.size,
          width: widget.size,
        );

      case DisplayMode.DM:
        // FIXME: add support for dm style
        return SizedBox(
          height: widget.size,
          width: widget.size,
        );
    }
  }
}
