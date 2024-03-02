import 'package:flutter/widgets.dart';

final myDraggable = Draggable(
  data: 10,
  feedback: Container(),
  childWhenDragging: Container(),
  dragAnchorStrategy: pointerDragAnchorStrategy,
  child: Container(),
);
final myLongPressDraggable = LongPressDraggable(
  data: 10,
  feedback: Container(),
  childWhenDragging: Container(),
  dragAnchorStrategy: pointerDragAnchorStrategy,
  child: Container(),
);

final myDragTarget = DragTarget(
    builder: (context, accepted, rejected) => Container(),
    onWillAccept: (data) => true,
    onAcceptWithDetails: (details) {},
    onAccept: (int data) {});
