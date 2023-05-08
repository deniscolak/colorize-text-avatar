import 'package:flutter_test/flutter_test.dart';

import 'package:acter_avatar/src/color_maker.dart';

void main() {
  test('Consistent surface color returned for "Hello, World!" string', () {
    const helloWorld = "Hello, World!";
    final factories = [
      ColorMaker.bold(),
      ColorMaker.pastels(),
      ColorMaker.simple()
    ];

    for (final hashbrowns in factories) {
      final firstPassGeneration =
          hashbrowns.generateColorFromString(helloWorld);
      final secondPassGeneration =
          hashbrowns.generateColorFromString(helloWorld);
      expect(firstPassGeneration.surfaceColor.value,
          equals(secondPassGeneration.surfaceColor.value));
    }
  });

  test('Different surface color returned for different string', () {
    const helloWorld = "Hello, World!";
    const otherString = "Other String!";
    final hashbrowns = ColorMaker.pastels();

    final firstItem = hashbrowns.generateColorFromString(helloWorld);
    final secondItem = hashbrowns.generateColorFromString(otherString);
    expect(firstItem.surfaceColor.value,
        isNot(equals(secondItem.surfaceColor.value)));
  });
}
