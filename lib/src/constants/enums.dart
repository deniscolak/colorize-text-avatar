/// Configure the shape the `TextAvatar` should use
enum Shape { Rectangle, Circular, None }

/// DisplayMode configures the `ActerAvatar` way of displaying the avatar
enum DisplayMode {
  /// Display the avatar as defined for showing a user (circle)
  User,

  /// Display the avatar for spaces
  Space,

  /// Display for Group Chats
  GroupChat,

  /// Display for direct messages between people
  DM,
}

/// Do you want the `ActerAvatar` wrapped in a `Tooltip`, configure it here
enum TooltipStyle {
  /// Do not wrap the Avatar in any Tooltip
  None,

  /// Use the Display Name for the Tooltip
  DisplayName,

  /// Use the UniqueId for the Tooltip
  UniqueId,

  /// Combine DisplayName and UniqueId or UniqueName as the Tooltip
  Combined,
}
