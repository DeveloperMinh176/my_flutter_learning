import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/selection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learn/codelabs/layout_basics.dart';

final name = "An";
final myText = Text(
  'Hello, $name! How are you?',
  textAlign: TextAlign.left,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(fontSize: 20),
  textDirection: TextDirection.ltr,
  selectionColor: Colors.amber,
  softWrap: true,
  semanticsLabel: "This is TextSpan",
  strutStyle: StrutStyle(),
);
final myTextRich = Text.rich(
  TextSpan(),
  textAlign: TextAlign.left,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(fontSize: 20),
  textDirection: TextDirection.ltr,
  selectionColor: Colors.amber,
  strutStyle: StrutStyle(),
  softWrap: true,
  semanticsLabel: "This is TextSpan",
);
final myRichText = RichText(
  text: TextSpan(),
  textAlign: TextAlign.left,
  overflow: TextOverflow.clip,
  textDirection: TextDirection.ltr,
  selectionRegistrar: null,
  selectionColor: Colors.amber,
  strutStyle: StrutStyle(),
  softWrap: true,
);

final myTextSpan = TextSpan(
    text: "This is TextSpan",
    children: <InlineSpan>[],
    style: TextStyle(),
    semanticsLabel: "This is TextSpan");

final myWidgetSpan = WidgetSpan(child: Container());

final myTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  fontFamily: "Raleway",
  fontFamilyFallback: ["Roboto"],
  fontStyle: FontStyle.italic,
  color: Colors.amber,
  background: Paint(),
  foreground: Paint(),
  decoration: TextDecoration.lineThrough,
  decorationColor: Colors.blue,
  decorationStyle: TextDecorationStyle.wavy,
  height: 2,
  overflow: TextOverflow.clip,
  backgroundColor: Colors.amber,
  package: "flutter_learn",
  textBaseline: TextBaseline.ideographic,
);

class MyTextAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          width: 100,
          child: Text(
            "Hello $name! How are you?",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text.rich(TextSpan(text: "Hello", children: <TextSpan>[
          TextSpan(
              text: " beautiful ",
              style: TextStyle(fontStyle: FontStyle.italic)),
          TextSpan(text: "world", style: TextStyle(fontWeight: FontWeight.bold))
        ])),
        SelectionArea(
          child: Column(children: [
            Text("Selectable Text"),
            SelectionContainer.disabled(child: Text("Non-Selectable Text")),
            Text("Selectable Text"),
            SelectionRichTextSelectionContainer(),
          ]),
        ),
        Text.rich(TextSpan(text: "My name is ", children: <InlineSpan>[
          WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 100),
                  child: TextField())),
          TextSpan(text: "."),
        ]))
      ],
    );
  }
}

class SelectionRichTextSelectionContainer extends StatefulWidget {
  @override
  State<SelectionRichTextSelectionContainer> createState() {
    return _SelectionRichTextSelectionContainerState();
  }
}

class _SelectionRichTextSelectionContainerState
    extends State<SelectionRichTextSelectionContainer> {
  @override
  Widget build(BuildContext context) {
    return SelectionContainer(
      delegate: RichTextSelectionContainerDelegate(),
      child: RichText(
        text: TextSpan(
            style: TextStyle(color: Colors.black),
            text: "Hello",
            children: <TextSpan>[
              TextSpan(
                  text: " bold ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "world"),
            ]),
        selectionRegistrar: SelectionContainer.maybeOf(context),
        selectionColor: Colors.amber,
      ),
    );
  }
}

class RichTextSelectionContainerDelegate
    extends MultiSelectableSelectionContainerDelegate {
  @override
  void ensureChildUpdated(Selectable selectable) {
    // TODO: implement ensureChildUpdated
  }
}
