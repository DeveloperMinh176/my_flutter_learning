import 'package:flutter/material.dart';

final myCustomSingleChildLayout = CustomSingleChildLayout(
  delegate: MyDelegate(),
  child: Text('abc'),
);

class MyDelegate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return false;
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(size.width - childSize.width, size.height - childSize.height);
  }
}
