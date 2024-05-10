import 'package:flutter/widgets.dart';

final myClipPath = ClipPath(
  clipper: MyCustomClipper(),
  child: Container(),
);

class MyCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, 5);
    path.moveTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldCustomClipper) {
    return false;
  }
}
