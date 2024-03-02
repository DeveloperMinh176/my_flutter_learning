import 'package:flutter/material.dart';
import 'dart:math';

var linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xff1f005c),
      Color(0xff5b0060),
      Color(0xff870160),
      Color(0xffac255e),
      Color(0xffca485c),
      Color(0xffe16b5c),
      Color(0xfff39060),
      Color(0xffffb56b),
    ],
    tileMode: TileMode.clamp,
    transform: GradientRotation(1),
    stops: [2, 3, 4, 5, 6, 7, 8, 9]);

var radialGradient = RadialGradient(
    center: Alignment.centerLeft,
    radius: 0.2,
    colors: <Color>[Colors.blue, Colors.red],
    stops: [0.3, 0.7],
    transform: GradientRotation(1),
    tileMode: TileMode.repeated);

var sweepGradient = SweepGradient(
    center: Alignment.centerRight,
    colors: [Colors.blue, Colors.red],
    stops: [0.2, 0.8],
    transform: GradientRotation(0),
    tileMode: TileMode.mirror);

class MyGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: SweepGradient(
          center: FractionalOffset.center,
          colors: <Color>[
            Color(0xFF4285F4), // blue
            Color(0xFF34A853), // green
            Color(0xFFFBBC05), // yellow
            Color(0xFFEA4335), // red
            Color(0xFF4285F4),
            // blue again to seamlessly transition to the start
          ],
          stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
          transform: GradientRotation(3.14 / 4),
        ),
      ),
    );
  }
}
