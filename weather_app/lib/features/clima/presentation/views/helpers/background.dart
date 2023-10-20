import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background(
      {super.key,
      required this.x,
      required this.y,
      required this.height,
      required this.width,
      required this.color});

  final double x, y, height, width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(x, y),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
