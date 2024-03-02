import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/selection.dart';

class MySelectionArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("MySelectionArea"),
        ),
        body: Center(
          child: SelectionAllOrNoneContainer(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Text 1"), Text("Text 2"), Text("Text 3")],
          )),
        ),
      ),
    );
  }
}

class SelectionAllOrNoneContainer extends StatefulWidget {
  SelectionAllOrNoneContainer({super.key, required this.child});

  final Widget child;
  @override
  State<SelectionAllOrNoneContainer> createState() {
    return _SelectionAllOrNoneContainerState();
  }
}

class _SelectionAllOrNoneContainerState
    extends State<SelectionAllOrNoneContainer> {
  @override
  Widget build(BuildContext context) {
    return SelectionContainer(
        child: widget.child, delegate: SelectAllOrNoneContainerDelegate());
  }
}

class SelectAllOrNoneContainerDelegate
    extends MultiSelectableSelectionContainerDelegate {
  Offset? _adjustedStartEdge;
  Offset? _adjustedEndEdge;
  bool _isSelected = false;
  @override
  void ensureChildUpdated(Selectable selectable) {
    if (_isSelected) {
      dispatchSelectionEventToChild(
          selectable, const SelectAllSelectionEvent());
    }
  }

  @override
  SelectionResult handleSelectWord(SelectWordSelectionEvent event) {
    return handleSelectAll(const SelectAllSelectionEvent());
  }

  @override
  SelectionResult handleSelectionEdgeUpdate(SelectionEdgeUpdateEvent event) {
    Rect containerRect =
        Rect.fromLTWH(0.0, 0.0, containerSize.width, containerSize.height);
    Matrix4 globalToLocal = getTransformTo(null)..invert();
    Offset localOffset =
        MatrixUtils.transformPoint(globalToLocal, event.globalPosition);
    Offset adjustOffset =
        SelectionUtils.adjustDragOffset(containerRect, localOffset);
    if (event.type == SelectionEventType.startEdgeUpdate) {
      _adjustedStartEdge = adjustOffset;
    } else {
      _adjustedEndEdge = adjustOffset;
    }
    if (_adjustedStartEdge != null && _adjustedEndEdge != null) {
      Rect selectionRect =
          Rect.fromPoints(_adjustedStartEdge!, _adjustedEndEdge!);
      if (!selectionRect.intersect(containerRect).isEmpty) {
        handleSelectAll(const SelectAllSelectionEvent());
      } else {
        super.handleClearSelection(const ClearSelectionEvent());
      }
    } else {
      super.handleClearSelection(const ClearSelectionEvent());
    }
    return SelectionUtils.getResultBasedOnRect(containerRect, adjustOffset);
  }

  @override
  SelectionResult handleClearSelection(ClearSelectionEvent event) {
    _isSelected = false;
    _adjustedStartEdge = null;
    _adjustedEndEdge = null;
    return super.handleClearSelection(event);
  }

  @override
  SelectionResult handleSelectAll(SelectAllSelectionEvent event) {
    return super.handleSelectAll(event);
  }
}
