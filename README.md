# Hashbrowns Text Avatar

Hashbrowns Text Avatar is a package to generate avatar based on your user initials. It supports to generate avatars based on your specification or it Hashbrowns your avatar by using predefined colors. Enjoy it!

![Hashbrowns Text Avatar](https://github.com/acterglobal/hashbrowns-text-avatar/raw/master/example/screenshots/img_4.png)

## Getting Started 🔥

It is an easy and powerful package to generate text avatars for your users!

Let's see how to generate an avatar easily!

### Usage of Hashbrowns Text Avatar 😎

Here is the only mandatory parameter is text.

```dart
TextAvatar(
    text: "Deniz Çolak",
)
```

![Hashbrowns Text Avatar](https://github.com/acterglobal/hashbrowns-text-avatar/raw/master/example/screenshots/img_1.png)

### Parameters of Text Avatar 😎

Here is the predefined shapes: Rectangle, Circular or None, if shape is null or not defined the default value similar with Rectangle but not same.

> Shape.Rectangle, Shape.Circular, Shape.None can be use.

```dart
TextAvatar(
    shape: Shape.Circular,
    text: "Deniz Çolak"
)
```

![Hashbrowns Text Avatar](https://github.com/acterglobal/hashbrowns-text-avatar/raw/master/example/screenshots/img_2.png)

numberLetters parameter allows user to generate Avatar more specific number of character.

> Developer can predefine `size` and `numberLetters`, if `numberLetters` is null or not defined the default value is `1`.

```dart
TextAvatar(
    shape: Shape.Rectangle,
    size: 35,
    numberLetters: 2,

)
```

![Hashbrowns Text Avatar](https://github.com/acterglobal/hashbrowns-text-avatar/raw/master/example/screenshots/img_3.png)

Other parameters can be change according to your specification.

> Developers can extend the TextAvatar model according to their specification, currently below parameters are supported.

```dart
TextAvatar(
    shape: Shape.Circular,
    size: 35
    textColor: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    upperCase: true,
    backgroundColor: Colors.black,
    numberLetters: 1,

    text: this.widget.userdata.fullname,
)
```

## Credits & License

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](/LICENSE)

Fork of the great [Colorize Text Avatar](https://pub.dev/packages/colorize_text_avatar) package by [Deniz Çolak](https://github.com/deniscolak).

Any additional work: © 2023 Acter Association, Denmark
