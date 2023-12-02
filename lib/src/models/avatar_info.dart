import 'package:flutter/material.dart';

class AvatarInfo {
  /// the uniqueId of avatar
  final String uniqueId;

  /// the display name they've chosen (optional)
  final String? displayName;

  /// if given, acts as alias for avatar in tooltip rather than `uniqueId`
  final String? uniqueName;

  /// The actual avatar image renderer (takes precedence over `imageProviderFuture`)
  final ImageProvider<Object>? avatar;

  /// a future that loads the avatar (show fallback until loaded)
  final Future<ImageProvider<Object>?>? avatarFuture;

  const AvatarInfo({
    required this.uniqueId,
    this.displayName,
    this.uniqueName,
    this.avatar,
    this.avatarFuture,
  });
}
