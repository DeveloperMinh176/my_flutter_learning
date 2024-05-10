import 'package:flutter/widgets.dart';

final myCustomMultiChildLayout = CustomMultiChildLayout(
  delegate: MyCustomMultiChildLayoutDelegate(),
  children: [],
);

class MyCustomMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    // TODO: implement performLayout
    positionChild('abc', Offset(0, 0));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    throw UnimplementedError();
  }
}
