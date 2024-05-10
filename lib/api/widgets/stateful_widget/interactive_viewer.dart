import 'package:flutter/widgets.dart';

final myInteractiveViewer = InteractiveViewer(
  boundaryMargin: EdgeInsets.all(20),
  minScale: 0.8,
  maxScale: 2.5,
  child: Text('a'),
);
