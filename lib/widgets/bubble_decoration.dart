import 'package:flutter/material.dart';
import 'package:innovation_test/ui/ui.dart';

class BubbleDecoration extends StatelessWidget {
  final double radius;
  final double? opacity;

  const BubbleDecoration({
    required this.radius,
    this.opacity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
          color:
              AppConst.primaryColor.withBlue(150).withOpacity(opacity ?? 0.3),
          shape: BoxShape.circle),
    );
  }
}
