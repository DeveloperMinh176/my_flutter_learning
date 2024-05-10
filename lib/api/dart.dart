import 'dart:ui' as ui;

import 'package:flutter/material.dart';

final myPaint = Paint()
  ..style = PaintingStyle.stroke
  ..color = Colors.black
  ..strokeWidth = 2
  ..strokeCap = StrokeCap.butt
  ..shader = ui.Gradient.linear(Offset(0, 0), Offset(0, 0), []);

final myPath = Path()
  ..lineTo(0, 0)
  ..moveTo(0, 0)
  ..close();

//canvas.drawLine(Offset(0, 0), Offset(0, 0), Paint());
//canvas.drawPath(Path(), Paint());

