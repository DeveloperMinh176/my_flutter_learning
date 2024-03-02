import 'package:flutter/material.dart';

final mySelectableText = SelectableText(
  'Hello, An! How are you?',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20),
  textDirection: TextDirection.ltr,
  semanticsLabel: "This is TextSpan",
  strutStyle: StrutStyle(),
  showCursor: true,
  cursorColor: Colors.amber,
  cursorRadius: Radius.circular(4),
  cursorWidth: 3,
  onTap: () {},
  contextMenuBuilder: (context, editableTextState) {
    final x = editableTextState.contextMenuButtonItems;
    x.add(ContextMenuButtonItem(onPressed: () {}));

    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: x,
    );
  },
  scrollPhysics: BouncingScrollPhysics(),
);
