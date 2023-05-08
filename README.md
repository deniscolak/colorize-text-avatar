# Acter Avatar

Acter Avatar is a package to generate avatar for the acter platform.

## Progress

- [x] `TextAvatars` based on text with custom color generator
- [ ] Generic `ActerAvatar` with:
  - [ ] automatic selection of shape & mode
  - [ ] image loader
  - [ ] optional border-support (with optional coloring support)
  - [ ] [multiavatar](https://pub.dev/packages/multiavatar) fallback support
- [ ] Generic `ActerAvatarPill` for inline displaying with:
  - [ ] internal `ActerAvatar`, click-action

---

## Components:

TextAvatar can generate avatars based on any string. It generates the background and foreground color based on your input string and shows the avatar via the text initials. Enjoy it!

![Acter Text Avatar](https://github.com/acterglobal/acter-avatar/raw/master/example/screenshots/img_4.png)

## Getting Started 🔥

It is an easy and powerful package to generate text avatars for your users!

Let's see how to generate an avatar easily!

### Usage of Acter's Text Avatar 😎

Here is the only mandatory parameter is text.

```dart
TextAvatar(
    text: "Deniz Çolak",
)
```

![Acter Text Avatar](https://github.com/acterglobal/acter-avatar/raw/master/example/screenshots/img_1.png)

### Parameters of Text Avatar 😎

Here is the predefined shapes: Rectangle, Circular or None, if shape is null or not defined the default value similar with Rectangle but not same.

> Shape.Rectangle, Shape.Circular, Shape.None can be use.

```dart
TextAvatar(
    shape: Shape.Circular,
    text: "Deniz Çolak"
)
```

![Acter Text Avatar](https://github.com/acterglobal/acter-avatar/raw/master/example/screenshots/img_2.png)

numberLetters parameter allows user to generate Avatar more specific number of character.

> Developer can predefine `size` and `numberLetters`, if `numberLetters` is null or not defined the default value is `1`.

```dart
TextAvatar(
    shape: Shape.Rectangle,
    size: 35,
    numberLetters: 2,

)
```

![Acter Text Avatar](https://github.com/acterglobal/acter-avatar/raw/master/example/screenshots/img_3.png)

Other parameters can be change according to your specification.

> Developers can extend the `TextAvatar` model according to their specification, currently below parameters are supported.

```dart
TextAvatar(
    shape: Shape.Circular,
    size: 35
    fontSize: 14,
    fontWeight: FontWeight.w600,
    upperCase: true,
    colorMaker: ColorMaker.bold(),
    colorGenerator: // custom ColorGenerator-function. colorMaker takes precedence
    numberLetters: 1,

    text: this.widget.userdata.displayname,
    sourceText: this.widget.userdata.username,
)
```

## Credits & License

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](/LICENSE)

Fork of the great [Colorize Text Avatar](https://pub.dev/packages/colorize_text_avatar) package by [Deniz Çolak](https://github.com/deniscolak).

Any additional work: © 2023 Acter Association, Denmark
