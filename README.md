# Colorize Text Avatar

Colorize Text Avatar is a package to generate avatar based on your user initials. It supports to generate avatars based on your specification or it colorize your avatar by using predefined colors. Enjoy it!

![Colorize Text Avatar](https://github.com/deniscolak/colorize-text-avatar/raw/master/example/screenshots/img_1.png)

## Getting Started 🔥

It is an easy and powerfull package to generate text avatars for your users! 

Let's see how to generate an avatar easily!

### Usage of Colorize Text Avatar 😎

Here is the only mandatory parameter is text.

```dart
TextAvatar(
    text: "Deniz Çolak",
),
```

![Colorize Text Avatar](https://github.com/deniscolak/colorize-text-avatar/raw/master/example/screenshots/img_1.png)

### Parameters of Text Avatar 😎

Here is the predefined shapes: Rectangle, Circular or None, if no shape is null the default value similar with Rectangle but not same.

> Shape.Rectangle, Shape.Circular, Shape.None can be use.

```dart
TextAvatar(
    shape: Shape.Circular,
    text: "Deniz Çolak"
)
```

![Colorize Text Avatar](https://github.com/deniscolak/colorize-text-avatar/raw/master/example/screenshots/img_2.png)

numberLetters parameter allows user to generate Avatar more specific number of character. 

> Developer can predefine size and numberLetters, if numberletters is null the default value is 1.

```dart
TextAvatar(
    shape: Shape.Rectangle,
    size: 35,
    numberLetters: 2,

)
```

![Colorize Text Avatar](https://github.com/deniscolak/colorize-text-avatar/raw/master/example/screenshots/img_3.png)


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



## License

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

2021 

## Youtube Channel

[![Youtube](https://lh3.googleusercontent.com/a-/AOh14GhCpmeHdwyiGTjusea5wnu1yEQltH5vTADhg1j8Og=s600-k-no-rp-mo)](https://www.youtube.com/channel/UCkTVeaaSuRoypP1hmDRr_Hg)

