import 'package:acter_avatar/acter_avatar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:multiavatar/multiavatar.dart';

class MultiAvatar extends StatelessWidget {
  final double? size;
  final String uniqueId;

  MultiAvatar({Key? key, required this.uniqueId, this.size});

  @override
  Widget build(BuildContext context) {
    String avatar = multiavatar(this.uniqueId);
    final svg = SvgPicture.string(avatar);
    final finalSize = (size == null || size! < 16.0) ? 16.0 : size;
    return SizedBox(
      height: finalSize,
      width: finalSize,
      child: svg,
    );
  }
}
