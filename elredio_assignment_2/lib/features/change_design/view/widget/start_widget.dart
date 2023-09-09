import 'package:flutter/material.dart';

import '../../../../resource/resource.dart';

class Star extends StatelessWidget {
  final double iconSize;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;

  const Star({
    Key? key,
    this.top,
    this.left,
    this.bottom,
    this.right,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Icon(
        Icons.star_rounded,
        color: AppColors.darkBlue,
        size: iconSize,
      ),
    );
  }
}
