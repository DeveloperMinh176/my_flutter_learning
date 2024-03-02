import 'package:flutter/widgets.dart';

final myDraggableScrollableSheet = DraggableScrollableSheet(
  builder: (context, scrollController) => Container(child: ListView()),
  initialChildSize: 0.5,
  minChildSize: 0.1,
  maxChildSize: 0.6,
);
