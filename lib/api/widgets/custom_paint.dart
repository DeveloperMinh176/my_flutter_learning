import 'package:flutter/widgets.dart';

final myCustomPaint =
    CustomPaint(painter: MyCustomPainter(), child: Container());

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint();
    canvas.drawPath(path, paint);
  }

  bool shouldRepaint(covariant CustomPainter oldCustomPainter) {
    return true;
  }
}
