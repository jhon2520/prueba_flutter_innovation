import 'package:flutter/material.dart';

class SquareDecoration extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const SquareDecoration({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color),
    );
  }
}
