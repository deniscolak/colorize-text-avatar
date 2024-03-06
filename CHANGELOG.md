## [unreleased]

- Fix: Show Parent even if we fallback for the main avatar

### [1.0.0+4]

- bump package dependencies.
- fix API usage in /example.

### [1.0.0+3]

- release first stable version.
- [Breaking Changes]:
  - ActerAvatar now supports `AvatarInfo` for specifying avatar data instead of singleton parameters.
  - Acter Avatar now supports `onAvatarTap()` and `onParentBadgeTap` for avatar gesture.
- added support for Group DM, GroupChat and Rectangle Avatars
- added support for parent badge for `DisplayMode.Space`
- added support for secondary stacked avatar for `DisplayMode.GroupDM`
- optimisation for avatar and fallback sizes
- added ci unit tests for avatar size, render and tap behavior

## Unreleased

### [0.0.7]

- add logging support
- error handling for avatar loading: show log.warning and go to fallback

### [0.0.6]

- new `ActerAvatar` wrapper widget
- `DisplayMode` added
- MultiUser fallback support
- loading of actual image in `ActerAvatar`
- improved support for image loading in `ActerAvatar`
- additional UniqueName support for canonical alias
- minor fixes around refreshing and setState after dispose

## [0.0.1] - 20230508 Forking `TextAvatar` to become `Acter-Avatar`

---

# Previous changelog of TextAvatar

## [1.0.3] - 02062021 Documentation Update

- Bug fix for background color

## [1.0.2] - 02062021 Documentation Update

- Images and examples are updated.

## [1.0.1] - 02062021 Documentation Update

- Documentation update to display images on pub.dev.

## [1.0.0] - 02062021 Nullsafety TextAvatar

- In that release minimum viable and usefull plugin released to allow developers to create colorful TextAvatars based on the Name Surname or given specification.
- It allows users to create colorful text avatar for each users based on the username or text starting letter.
- Improvements will release in next version.
