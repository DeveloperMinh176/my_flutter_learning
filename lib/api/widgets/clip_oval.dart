import 'package:flutter/widgets.dart';

final myClipOval = ClipOval(
  clipper: myCustomClipper(),
  child: Container(),
);

class myCustomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(center: Offset(0, 0), radius: 2);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
