import 'package:flutter/widgets.dart';

final myScrollable = Scrollable(
    axisDirection: AxisDirection.left,
    clipBehavior: Clip.hardEdge,
    physics: NeverScrollableScrollPhysics(),
    controller: ScrollController(),
    semanticChildCount: 3,
    viewportBuilder: (context, position) {
      return ListView();
    });
