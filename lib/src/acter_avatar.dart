import 'package:acter_avatar/acter_avatar.dart';
import 'package:acter_avatar/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final log = Logger('ActerAvatar');

/// ActerAvatar allows you to display the different types of Avatars in the
/// acter.global app.
///
/// If no avatar is found, the widget renders the fallback according to the
/// configured `DisplayMode`. If an avatar is found, that is being shown. Any
/// image resizing (for memory purposes) has to be done beforehand, the image
/// is shown as given.
class ActerAvatar extends StatefulWidget {
  /// Set the display mode for this Avatar.
  final DisplayMode mode;

  /// The size this Avatar has.
  final double? size;

  /// The size of parent badge in `DisplayMode.Space`
  final double? badgeSize;

  /// If and how to display the tooltip.
  final TooltipStyle tooltip;

  /// If and how to display secondary tooltip.
  /// For avatars of `DisplayMode.Space` parent badge,
  /// and `DisplayMode.GroupDM`
  final TooltipStyle secondaryToolTip;

  /// See [UserInfo].
  final AvatarInfo avatarInfo;

  /// A list holding [UserInfo].
  /// Useful for showing stacked avatars for `DisplayMode.GroupDM` or `DisplayMode.Space` parentBadge.
  final List<AvatarInfo>? avatarsInfo;

  ActerAvatar(
      {Key? key,
      required this.avatarInfo,
      required this.mode,
      this.avatarsInfo,
      this.tooltip = TooltipStyle.Combined,
      this.secondaryToolTip = TooltipStyle.Combined,
      this.size,
      this.badgeSize})
      : super(key: key ?? Key('avatar-${avatarInfo.uniqueId}-$size'));

  @override
  _ActerAvatar createState() => _ActerAvatar();
}

class _ActerAvatar extends State<ActerAvatar> {
  bool imgSuccess = false;
  bool secondaryImgSuccess = false;
  ImageProvider<Object>? avatar;
  ImageProvider<Object>? secondaryAvatar;

  @override
  void initState() {
    super.initState();
    ImageStreamListener listener =
        ImageStreamListener(setImage, onError: setImageError);
    ImageStreamListener secondaryListener =
        ImageStreamListener(setSecondaryImage, onError: setSecondaryImageError);

    if (widget.avatarInfo.avatar != null) {
      if (widget.avatarsInfo != null && widget.avatarsInfo!.isNotEmpty) {
        widget.avatarsInfo![0].avatar!
            .resolve(ImageConfiguration())
            .addListener(secondaryListener);
      }
      widget.avatarInfo.avatar!
          .resolve(ImageConfiguration())
          .addListener(listener);
    } else if (widget.avatarInfo.imageProviderFuture != null) {
      if (widget.avatarsInfo != null && widget.avatarsInfo!.isNotEmpty) {
        fetchSecondaryImageProvider(secondaryListener);
      }
      fetchImageProvider(listener);
    }
  }

  void fetchImageProvider(ImageStreamListener listener) async {
    var res = await widget.avatarInfo.imageProviderFuture!;
    res!.resolve(ImageConfiguration()).addListener(listener);
    avatar = res;
  }

  void fetchSecondaryImageProvider(ImageStreamListener listener) async {
    var res = await widget.avatarsInfo![0].imageProviderFuture!;
    res!.resolve(ImageConfiguration()).addListener(listener);
    secondaryAvatar = res;
  }

  void setImage(ImageInfo image, bool sync) {
    if (mounted) {
      setState(() => imgSuccess = true);
    }
  }

  void setSecondaryImage(ImageInfo image, bool sync) {
    if (mounted) {
      setState(() => secondaryImgSuccess = true);
    }
  }

  void setImageError(Object obj, StackTrace? st) {
    if (mounted) {
      setState(() => imgSuccess = false);
    }
  }

  void setSecondaryImageError(Object obj, StackTrace? st) {
    if (mounted) {
      setState(() => secondaryImgSuccess = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final child = inner(context);
    switch (widget.tooltip) {
      case TooltipStyle.DisplayName:
        return Tooltip(
          message: widget.avatarInfo.displayName ?? widget.avatarInfo.uniqueId,
          child: child,
        );
      case TooltipStyle.UniqueId:
        return Tooltip(message: widget.avatarInfo.uniqueId, child: child);
      case TooltipStyle.Combined:
        var message =
            widget.avatarInfo.uniqueName ?? widget.avatarInfo.uniqueId;
        if (widget.avatarInfo.displayName != null) {
          message =
              '${widget.avatarInfo.displayName} (${widget.avatarInfo.uniqueId})';
        }
        return Tooltip(message: message, child: child);
      case TooltipStyle.None:
        return child;
    }
  }

  Widget inner(BuildContext context) {
    if (widget.avatarInfo.avatar != null && imgSuccess == true) {
      return renderWithAvatar(context, widget.avatarInfo.avatar!);
    } else if (avatar != null && imgSuccess == true) {
      return renderWithAvatar(context, avatar!);
    } else {
      return renderFallback(context);
    }
  }

  void avatarError(Object error, StackTrace? stackTrace) {
    log.warning(
      'Error loading avatar for ${widget.avatarInfo.uniqueId}. Returning to fallback.',
      error,
      stackTrace,
    );
    if (mounted) {
      setState(() {
        avatar = null;
        imgSuccess = false;
      });
    }
  }

  void secondaryAvatarError(Object error, StackTrace? stackTrace) {
    log.warning(
      'Error loading avatar for ${widget.avatarsInfo![0].uniqueId}. Returning to fallback.',
      error,
      stackTrace,
    );
    if (mounted) {
      setState(() {
        secondaryAvatar = null;
        secondaryImgSuccess = false;
      });
    }
  }

  String? secTooltipMsg() {
    if (widget.avatarsInfo != null || widget.avatarsInfo!.isNotEmpty) {
      switch (widget.secondaryToolTip) {
        case TooltipStyle.DisplayName:
          return widget.avatarsInfo![0].displayName ??
              widget.avatarsInfo![0].uniqueId;
        case TooltipStyle.UniqueId:
          return widget.avatarsInfo![0].uniqueId;
        case TooltipStyle.Combined:
          var message = widget.avatarsInfo![0].uniqueName ??
              widget.avatarsInfo![0].uniqueId;
          if (widget.avatarsInfo![0].displayName != null) {
            message =
                '${widget.avatarsInfo![0].displayName} (${widget.avatarsInfo![0].uniqueId})';
          }
          return message;
        case TooltipStyle.None:
          return null;
      }
    } else {
      return null;
    }
  }

  Widget renderWithAvatar(BuildContext context, ImageProvider avatar) {
    switch (widget.mode) {
      case DisplayMode.DM:
        return CircleAvatar(
          foregroundImage: avatar,
          onForegroundImageError: avatarError,
          radius: widget.size ?? 24,
        );
      case DisplayMode.Space:
        double badgeOverflow = badgeSize / 5;
        return Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              height: widget.size ?? 48,
              width: widget.size ?? 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: avatar,
                  onError: avatarError,
                ),
              ),
            ),
            Positioned(
              bottom: -badgeOverflow,
              right: -badgeOverflow,
              child: widget.avatarsInfo == null || widget.avatarsInfo!.isEmpty
                  ? SizedBox(height: badgeSize + badgeOverflow)
                  : Column(
                      children: <Widget>[
                        SizedBox(
                          height: widget.badgeSize ?? badgeSize,
                          width: widget.badgeSize ?? badgeSize,
                          child: widget.secondaryToolTip != TooltipStyle.None
                              ? Tooltip(
                                  message: secTooltipMsg(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: widget.avatarsInfo![0].avatar!,
                                        onError: secondaryAvatarError,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: widget.avatarsInfo![0].avatar!,
                                      onError: secondaryAvatarError,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
            ),
          ],
        );
      case DisplayMode.GroupChat:
        return Container(
          height: widget.size ?? 48,
          width: widget.size ?? 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: avatar,
              onError: avatarError,
            ),
          ),
        );
      case DisplayMode.GroupDM:
        return widget.avatarsInfo != null && widget.avatarsInfo!.isNotEmpty
            ? Stack(
                alignment: Alignment.bottomLeft,
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    foregroundImage: avatar,
                    onForegroundImageError: avatarError,
                    radius: widget.size ?? 24,
                  ),
                  Positioned(
                    left: -7,
                    bottom: -5,
                    child: widget.secondaryToolTip != TooltipStyle.None
                        ? Tooltip(
                            message: secTooltipMsg(),
                            child: CircleAvatar(
                              foregroundImage: widget.avatarsInfo![0].avatar,
                              onForegroundImageError: secondaryAvatarError,
                              radius: widget.size ?? 24,
                            ),
                          )
                        : CircleAvatar(
                            foregroundImage: widget.avatarsInfo![0].avatar,
                            onForegroundImageError: secondaryAvatarError,
                            radius: widget.size ?? 24,
                          ),
                  ),
                  widget.avatarsInfo!.length > 1
                      ? Positioned.fill(
                          bottom: -5,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 15,
                              height: 15,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '+${widget.avatarsInfo!.length - 1}',
                                style: const TextStyle(fontSize: 8),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              )
            : CircleAvatar(
                foregroundImage: avatar,
                onForegroundImageError: avatarError,
                radius: widget.size ?? 24,
              );
    }
  }

  Widget renderFallback(BuildContext context) {
    double badgeOverflow = badgeSize / 5;
    double fallbackSize = widget.size == null ? 48 : widget.size! * 2.0;

    /// Fallback
    switch (widget.mode) {
      case DisplayMode.DM:
        // User fallback mode
        return MultiAvatar(
          uniqueId: widget.avatarInfo.uniqueId,
          size: fallbackSize,
        );
      case DisplayMode.GroupDM:
        return widget.avatarsInfo != null && widget.avatarsInfo!.isNotEmpty
            ? Stack(
                alignment: Alignment.bottomLeft,
                clipBehavior: Clip.none,
                children: [
                  MultiAvatar(
                    uniqueId: widget.avatarInfo.uniqueId,
                    size: fallbackSize,
                  ),
                  Positioned(
                    left: -7,
                    bottom: -5,
                    child: widget.secondaryToolTip != TooltipStyle.None
                        ? Tooltip(
                            message: secTooltipMsg(),
                            child: MultiAvatar(
                              uniqueId: widget.avatarsInfo![0].uniqueId,
                              size: fallbackSize,
                            ),
                          )
                        : MultiAvatar(
                            uniqueId: widget.avatarsInfo![0].uniqueId,
                            size: fallbackSize,
                          ),
                  ),
                  widget.avatarsInfo!.length > 1
                      ? Positioned.fill(
                          bottom: -5,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 15,
                              height: 15,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '+${widget.avatarsInfo!.length - 1}',
                                style: const TextStyle(fontSize: 8),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              )
            : MultiAvatar(
                uniqueId: widget.avatarInfo.uniqueId,
                size: fallbackSize,
              );
      case DisplayMode.Space:
        return Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            TextAvatar(
              text: widget.avatarInfo.displayName ??
                  simplifyUserId(widget.avatarInfo.uniqueId) ??
                  '!',
              sourceText: widget.avatarInfo.uniqueId,
              size: fallbackSize,
              shape: Shape.Rectangle,
            ),
            Positioned(
              bottom: -badgeOverflow,
              right: -badgeOverflow,
              child: widget.avatarsInfo == null || widget.avatarsInfo!.isEmpty
                  ? SizedBox(height: badgeSize + badgeOverflow)
                  : Column(
                      children: <Widget>[
                        SizedBox(
                          height: widget.badgeSize ?? badgeSize,
                          width: widget.badgeSize ?? badgeSize,
                          child: widget.secondaryToolTip != TooltipStyle.None
                              ? Tooltip(
                                  message: secTooltipMsg(),
                                  child: TextAvatar(
                                    text: widget.avatarsInfo![0].displayName ??
                                        simplifyUserId(
                                            widget.avatarsInfo![0].uniqueId) ??
                                        '!',
                                    sourceText: widget.avatarsInfo![0].uniqueId,
                                    fontSize: 6,
                                    shape: Shape.Rectangle,
                                  ),
                                )
                              : TextAvatar(
                                  text: widget.avatarsInfo![0].displayName ??
                                      simplifyUserId(
                                          widget.avatarsInfo![0].uniqueId) ??
                                      '!',
                                  sourceText: widget.avatarsInfo![0].uniqueId,
                                  fontSize: 6,
                                  shape: Shape.Rectangle,
                                ),
                        ),
                      ],
                    ),
            ),
          ],
        );
      case DisplayMode.GroupChat:
        return TextAvatar(
          text: widget.avatarInfo.displayName ??
              simplifyUserId(widget.avatarInfo.uniqueId) ??
              '!',
          sourceText: widget.avatarsInfo![0].uniqueId,
          size: fallbackSize,
          shape: Shape.Rectangle,
        );
    }
  }
}
