// This is a basic Flutter widget test.

// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:acter_avatar/acter_avatar.dart';
import 'package:acter_avatar/src/constants/keys.dart';
import 'package:flutter/material.dart';
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
      await tester.pumpAndSettle();
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
      await tester.pumpAndSettle();
      final Size avatarSize =
          tester.getSize(find.byKey(TestKeys.circleAvatarKey));
      // should expect default fallback avatar size
      expect(avatarSize.height, equals(48));
      expect(avatarSize.width, equals(48));
    });

    testWidgets('User Circle Avatar with AssetImage render',
        (WidgetTester tester) async {
      final String imagePath =
          'https://st.depositphotos.com/1898481/5087/i/450/depositphotos_50878063-stock-photo-people.jpg';
      final image = NetworkImage(imagePath);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.circleAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: '@test:acter.org', avatar: image),
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
      expect(avatar.avatarInfo.avatar, NetworkImage(imagePath));
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
      expect(avatarSize.height, equals(36));
      expect(avatarSize.width, equals(36));
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

    testWidgets('Rectangular Avatar with NetworkImage render',
        (WidgetTester tester) async {
      final String imagePath =
          'https://st5.depositphotos.com/38460822/63964/i/600/depositphotos_639649504-stock-photo-mail-sign-sign-alphabet-made.jpg';
      final image = NetworkImage(imagePath);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.rectangleAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: '@test:acter.org', avatar: image),
            mode: DisplayMode.Space,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final avatarFinder = find.byKey(TestKeys.rectangleAvatarKey);
      // should expect `ActerAvatar` is present
      expect(avatarFinder, findsOneWidget);
      final avatar = avatarFinder.evaluate().first.widget as ActerAvatar;
      // should expect Asset Image in case of image render.
      expect(avatar.avatarInfo.avatar, NetworkImage(imagePath));
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
    testWidgets('Rectangular Avatar Parent badge with NetworkImage render',
        (WidgetTester tester) async {
      final String imagePath =
          'https://st5.depositphotos.com/38460822/63964/i/600/depositphotos_639649504-stock-photo-mail-sign-sign-alphabet-made.jpg';
      final image = NetworkImage(imagePath);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.rectangleAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: '@test:acter.org'),
            avatarsInfo: [AvatarInfo(uniqueId: 'Acter-Global', avatar: image)],
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
      expect(avatar.avatarsInfo?[0].avatar, NetworkImage(imagePath));
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
    testWidgets('Circular Stacked Avatars with NetworkImage render',
        (WidgetTester tester) async {
      final String imagePath =
          'https://st.depositphotos.com/1898481/5087/i/450/depositphotos_50878063-stock-photo-people.jpg';
      final String image2Path =
          'https://st.depositphotos.com/1898481/4683/i/600/depositphotos_46839071-stock-photo-male-person-silhouette.jpg';
      final image = NetworkImage(imagePath);
      final secondaryImage = NetworkImage(image2Path);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ActerAvatar(
            key: TestKeys.stackedAvatarKey,
            avatarInfo: AvatarInfo(uniqueId: '@test:acter.org', avatar: image),
            mode: DisplayMode.GroupDM,
            avatarsInfo: [
              AvatarInfo(
                uniqueId: '@kyra:acter.org',
                avatar: secondaryImage,
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
      expect(avatar.avatarInfo.avatar, NetworkImage(imagePath));
      expect(avatar.avatarsInfo?[0].avatar, NetworkImage(image2Path));
    });
  });

  group('Acter avatars interaction', () {
    GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    void onTapped(BuildContext ctx, String name) {
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(name),
        duration: const Duration(milliseconds: 750),
      ));
    }

    testWidgets('test primary avatar interaction', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(builder: (context) {
            return Column(
              children: <Widget>[
                ActerAvatar(
                  key: TestKeys.circleAvatarKey,
                  avatarInfo: AvatarInfo(uniqueId: '@test:acter.org'),
                  mode: DisplayMode.DM,
                  onAvatarTap: () => onTapped(context, 'DM Avatar tapped'),
                ),
                ActerAvatar(
                  key: TestKeys.stackedAvatarKey,
                  avatarInfo: AvatarInfo(uniqueId: '@test:acter.org'),
                  mode: DisplayMode.GroupDM,
                  avatarsInfo: [
                    AvatarInfo(
                      uniqueId: '@kyra:acter.org',
                    )
                  ],
                  onAvatarTap: () =>
                      onTapped(context, 'Group DM Avatar tapped'),
                ),
                ActerAvatar(
                  key: TestKeys.widgetKey,
                  avatarInfo: AvatarInfo(uniqueId: '@test:acter.org'),
                  mode: DisplayMode.GroupChat,
                  onAvatarTap: () =>
                      onTapped(context, 'Group Chat Avatar tapped'),
                ),
                ActerAvatar(
                  key: TestKeys.rectangleAvatarKey,
                  avatarInfo: AvatarInfo(uniqueId: '@test:acter.org'),
                  mode: DisplayMode.Space,
                  onAvatarTap: () => onTapped(context, 'Space Avatar tapped'),
                ),
              ],
            );
          }),
        ),
      ));
      final dmGestureFinder = find.descendant(
          of: find.byKey(TestKeys.circleAvatarKey),
          matching: find.byType(GestureDetector));
      // we have found the Gesture Detector, proceed with tester operation
      expect(dmGestureFinder, findsOneWidget);

      final groupDMGestureFinder = find.descendant(
          of: find.byKey(TestKeys.stackedAvatarKey),
          matching: find.byType(GestureDetector));
      // we have found the Gesture Detector, proceed with tester operation
      expect(groupDMGestureFinder, findsOneWidget);

      final groupChatGestureFinder = find.descendant(
          of: find.byKey(TestKeys.widgetKey),
          matching: find.byType(GestureDetector));
      // we have found the Gesture Detector, proceed with tester operation
      expect(groupChatGestureFinder, findsOneWidget);

      final spaceGestureFinder = find.descendant(
          of: find.byKey(TestKeys.rectangleAvatarKey),
          matching: find.byType(GestureDetector));
      // we have found the Gesture Detector, proceed with tester operation
      expect(spaceGestureFinder, findsOneWidget);

      await tester.tap(dmGestureFinder);
      await tester.pump();
      expect(find.text('DM Avatar tapped'), findsOneWidget);

      // dismissing snackbar
      ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();

      await tester.tap(groupDMGestureFinder);
      await tester.pump();
      expect(find.text('Group DM Avatar tapped'), findsOneWidget);

      // dismissing snackbar
      ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();

      await tester.tap(groupChatGestureFinder);
      await tester.pump();
      expect(find.text('Group Chat Avatar tapped'), findsOneWidget);

      // dismissing snackbar
      ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();

      await tester.tap(spaceGestureFinder);
      await tester.pump();
      expect(find.text('Space Avatar tapped'), findsOneWidget);
    });

    /// TODO: add test for parent badge interaction. Currently facing issues
    /// with finding deep descendant Gesture Detector.
  });
}
