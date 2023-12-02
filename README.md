# Acter Avatar

Acter Avatar is a package to generate different shapes of avatars by leveraging the combination of [Multiavatar](https://pub.dev/packages/multiavatar) library and Textual Avatar mechanism. The package is a derivative work from [Acter a3](https://github.com/acterglobal/a3) ongoing development.

# CI Test Status

<a href="https://github.com/acterglobal/acter-avatar/actions"><img src="https://github.com/acterglobal/acter-avatar/workflows/acter-avatar-tests/badge.svg" alt="Build Status"></a>

## Parameters of ActerAvatar:

| Parameter          |                    Description                     | Type                |
| :----------------- | :------------------------------------------------: | :------------------ |
| `mode`             |    enum for rendering avatar shape (required).     | _enum_              |
| `size`             |             Size of Avatar (optional).             | _double_            |
| `badgeSize`        |   Size of Space Avatar parent badge (optional).    | _double_            |
| `tooltip`          |               `ActerAvatar` tooltip.               | _TooltipStyle_      |
| `secondaryToolTip` |  Space Avatar OR Stack secondary avatar tooltip.   | _TooltipStyle_      |
| `avatarInfo`       | Holds avatar data. See [AvatarInfo] below section. | _AvatarInfo_        |
| `onAvatarTap`      |   Primary avatar interacton function (optional).   | _Function()?_       |
| `avatarsInfo`      |  for space and circular stack avatars.(optional)   | _List<AvatarInfo>?_ |
| `onParentBadgeTap` | Secondary avatar interaction function (optional).  | _Function()?_       |

## AvatarInfo

`AvatarInfo` class allows you to store avatar related data. See API documentation for reference.

### Usage of ActerAvatar 😎

`ActerAvatar` takes both `mode` and `avatarInfo` param to render avatar. The param `uniqueId` in `AvatarInfo` is required.

```dart
      ActerAvatar(
        mode: DisplayMode.DM,
        avatarInfo: AvatarInfo(
        uniqueId: '@aliKah:lorem.org',
        displayName: 'Ali Akalın',
        avatar: NetworkImage(*someImageLink*)),  // can be any image provider .i.e. AssetImage, MemoryImage and NetworkImage etc.
      ),
```

Alternatively you can also provide future avatar in `AvatarInfo` which will show fallback until loaded if data isn't readily available.

```dart
      ActerAvatar(
        mode: DisplayMode.DM,
        avatarInfo: AvatarInfo(
        uniqueId: '@aliKah:lorem.org',
        displayName: 'Ali Akalın',
        avatarFuture: someFuture),  // can be any image provider .i.e. AssetImage, MemoryImage and NetworkImage etc.
      ),
```

You can also provide list of `AvatarInfo` with `avatarsInfo` param for displaying parent badges and circular stacked avatars.

```dart
      ActerAvatar(
        mode: DisplayMode.Space,
        avatarInfo: AvatarInfo(
        uniqueId: '@aliKah:lorem.org',
        displayName: 'Ali Akalın',
        avatar: NetworkImage(*someImageLink*),
        avatarInfo: [
          // more `AvatarInfo` here.
        ]),
      ),
```

## Credits & License

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](/LICENSE)

Fork of the great [Colorize Text Avatar](https://pub.dev/packages/colorize_text_avatar) package by [Deniz Çolak](https://github.com/deniscolak).

Any additional work: © 2023 Acter Association, Denmark
