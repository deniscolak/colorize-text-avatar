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
    final actual_size = (size == null || size! < 32.0) ? 48.0 : size;
    return SizedBox(
      height: actual_size,
      width: actual_size,
      child: svg,
    );
  }
}
