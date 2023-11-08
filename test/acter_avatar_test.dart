// This is a basic Flutter widget test.

// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:acter_avatar/acter_avatar.dart';
import 'package:acter_avatar/src/constants/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Circular Avatar tests', () {
    testWidgets('User Circle Avatar with specified size',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.circleAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: 'test:acter.org'),
            mode: DisplayMode.DM,
            size: 36,
          ),
        ),
      ));
      await tester.pumpAndSettle(Duration(seconds: 3));
      final Size avatarSize =
          tester.getSize(find.byKey(TestKeys.circleAvatarKey));

      // should expect specified fallback size
      // diameter (size) is twice of radius size so we would expect x2 of specified size
      expect(avatarSize.height, equals(36 * 2));
      expect(avatarSize.width, equals(36 * 2));
    });
    testWidgets('User Circle Avatar with fallback size',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.circleAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: 'test:acter.org'),
            mode: DisplayMode.DM,
          ),
        ),
      ));
      await tester.pumpAndSettle(Duration(seconds: 3));
      final Size avatarSize =
          tester.getSize(find.byKey(TestKeys.circleAvatarKey));
      // should expect default fallback avatar size
      expect(avatarSize.height, equals(48));
      expect(avatarSize.width, equals(48));
    });

    testWidgets('User Circle Avatar with AssetImage render',
        (WidgetTester tester) async {
      final String imagePath = 'assets/images/avatar-1.jpg';
      await rootBundle.load(imagePath);
      final assetImage = AssetImage(imagePath);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.circleAvatarKey,
            avatarInfo:
                AvatarInfo(uniqueId: '@test:acter.org', avatar: assetImage),
            mode: DisplayMode.DM,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final avatarFinder = find.byKey(TestKeys.circleAvatarKey);
      // should expect `ActerAvatar` is present
      expect(avatarFinder, findsOneWidget);
      final avatar = avatarFinder.evaluate().first.widget as ActerAvatar;
      // should expect Asset Image in case of image render.
      expect(avatar.avatarInfo.avatar, AssetImage(imagePath));
    });
  });

  group('Rectangular Avatar tests', () {
    testWidgets('Rectangular Avatar with specified size',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.rectangleAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: 'test:acter.org'),
            mode: DisplayMode.Space,
            size: 36,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final Size avatarSize =
          tester.getSize(find.byKey(TestKeys.rectangleAvatarKey));

      // should expect specified fallback size
      // diameter (size) is twice of radius size so we would expect x2 of specified size
      expect(avatarSize.height, equals(36 * 2));
      expect(avatarSize.width, equals(36 * 2));
    });
    testWidgets('Rectangular Avatar with fallback size',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.rectangleAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: 'test:acter.org'),
            mode: DisplayMode.Space,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final Size avatarSize =
          tester.getSize(find.byKey(TestKeys.rectangleAvatarKey));
      // should expect default fallback avatar size
      expect(avatarSize.height, equals(48));
      expect(avatarSize.width, equals(48));
    });

    testWidgets('Rectangular Avatar with AssetImage render',
        (WidgetTester tester) async {
      final String imagePath = 'assets/images/avatar-1.jpg';
      await rootBundle.load(imagePath);
      final assetImage = AssetImage(imagePath);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.circleAvatarKey,
            avatarInfo:
                AvatarInfo(uniqueId: '@test:acter.org', avatar: assetImage),
            mode: DisplayMode.Space,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final avatarFinder = find.byKey(TestKeys.circleAvatarKey);
      // should expect `ActerAvatar` is present
      expect(avatarFinder, findsOneWidget);
      final avatar = avatarFinder.evaluate().first.widget as ActerAvatar;
      // should expect Asset Image in case of image render.
      expect(avatar.avatarInfo.avatar, AssetImage(imagePath));
    });

    testWidgets('Rectangular Avatar Parent Badge specified size',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.rectangleAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: '@test:acter.org'),
            avatarsInfo: [AvatarInfo(uniqueId: 'Acter-Global')],
            mode: DisplayMode.Space,
            badgeSize: 35,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final avatarFinder = find.byKey(TestKeys.rectangleAvatarKey);
      // should expect `ActerAvatar` is present
      expect(avatarFinder, findsOneWidget);
      final sizedBoxSize = tester.getSize(find.byType(SizedBox));
      // expect parent badge specified size.
      expect(sizedBoxSize.height, equals(35));
      expect(sizedBoxSize.width, equals(35));
    });
    testWidgets('Rectangular Avatar Parent Badge fallback size',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.rectangleAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: '@test:acter.org'),
            avatarsInfo: [AvatarInfo(uniqueId: 'Acter-Global')],
            mode: DisplayMode.Space,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final avatarFinder = find.byKey(TestKeys.rectangleAvatarKey);
      // should expect `ActerAvatar` is present
      expect(avatarFinder, findsOneWidget);
      final sizedBoxSize = tester.getSize(find.byType(SizedBox));
      // expect parent badge fallback size.
      expect(sizedBoxSize.height, equals(20));
      expect(sizedBoxSize.width, equals(20));
    });
    testWidgets('Rectangular Avatar Parent badge with AssetImage render',
        (WidgetTester tester) async {
      final String imagePath = 'assets/images/space-1.jpg';
      await rootBundle.load(imagePath);
      final assetImage = AssetImage(imagePath);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.rectangleAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: '@test:acter.org'),
            avatarsInfo: [
              AvatarInfo(uniqueId: 'Acter-Global', avatar: assetImage)
            ],
            mode: DisplayMode.Space,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final avatarFinder = find.byKey(TestKeys.rectangleAvatarKey);
      // should expect `ActerAvatar` is present
      expect(avatarFinder, findsOneWidget);
      final avatar = avatarFinder.evaluate().first.widget as ActerAvatar;
      // should expect parent badge Asset Image in case of image render.
      expect(avatar.avatarsInfo?[0].avatar, AssetImage(imagePath));
    });
  });

  group('Circular Stacked Avatar tests', () {
    testWidgets('Circular Stacked Avatars with specified size',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.stackedAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: '@test:acter.org'),
            avatarsInfo: [AvatarInfo(uniqueId: '@kyra:acter.org')],
            mode: DisplayMode.GroupDM,
            size: 24,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final Size avatarSize =
          tester.getSize(find.byKey(TestKeys.stackedAvatarKey));

      // should expect first avatar specified size
      // diameter (size) is twice of radius size so we would expect x2 of specified size
      expect(avatarSize.height, equals(24 * 2));
      expect(avatarSize.width, equals(24 * 2));

      final secondAvatarSize = tester.getSize(find.byType(Positioned));

      // should expect second avatar specified size
      // diameter (size) is twice of radius size so we would expect x2 of specified size
      expect(secondAvatarSize.height, equals(24 * 2));
      expect(secondAvatarSize.width, equals(24 * 2));
    });
    testWidgets('Circular Stacked Avatars with fallback size',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.stackedAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: '@test:acter.org'),
            avatarsInfo: [AvatarInfo(uniqueId: '@kyra:acter.org')],
            mode: DisplayMode.GroupDM,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final Size avatarSize =
          tester.getSize(find.byKey(TestKeys.stackedAvatarKey));

      // should expect first avatar fallback size
      expect(avatarSize.height, equals(48));
      expect(avatarSize.width, equals(48));

      final secondAvatarSize = tester.getSize(find.byType(Positioned));

      // should expect second avatar specified size
      expect(secondAvatarSize.height, equals(48));
      expect(secondAvatarSize.width, equals(48));
    });
    testWidgets('Circular Stacked Avatars with AssetImage render',
        (WidgetTester tester) async {
      final String imagePath = 'assets/images/avatar-1.jpg';
      final String image2Path = 'assets/images/avatar-2.jpg';
      await rootBundle.load(imagePath);
      await rootBundle.load(image2Path);
      final assetImage = AssetImage(imagePath);
      final asset2Image = AssetImage(image2Path);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.stackedAvatarKey,
            avatarInfo:
                AvatarInfo(uniqueId: '@test:acter.org', avatar: assetImage),
            mode: DisplayMode.GroupDM,
            avatarsInfo: [
              AvatarInfo(
                uniqueId: '@kyra:acter.org',
                avatar: asset2Image,
              )
            ],
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final avatarFinder = find.byKey(TestKeys.stackedAvatarKey);
      // should expect `ActerAvatar` is present
      expect(avatarFinder, findsOneWidget);
      final avatar = avatarFinder.evaluate().first.widget as ActerAvatar;
      // should expect Asset Image in case of image render.
      expect(avatar.avatarInfo.avatar, AssetImage(imagePath));
      expect(avatar.avatarsInfo?[0].avatar, AssetImage(image2Path));
    });
  });
}
