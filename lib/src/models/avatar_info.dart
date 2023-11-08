import 'package:flutter/material.dart';

class AvatarInfo {
  /// the uniqueId of this object (e.g. full username or roomId)
  /// used to calculate the Multiavatar in `DisplayMode.User`.
  final String uniqueId;

  /// the display name they've chosen
  final String? displayName;

  /// a canonical uniqueName to use instead of the uniqueId in the tooltip, if given.
  /// most commonly this is the canonical alias for a space/room rather than the roomID
  final String? uniqueName;

  /// The actual avatar (takes precedence)
  final ImageProvider<Object>? avatar;

  /// Or alternatively a future that loads the avatar (show fallback until loaded)
  final Future<ImageProvider<Object>?>? imageProviderFuture;

  const AvatarInfo({
    required this.uniqueId,
    this.displayName,
    this.uniqueName,
    this.avatar,
    this.imageProviderFuture,
  });
}
