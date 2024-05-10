import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final myTable = Table(
  children: [
    TableRow(decoration: BoxDecoration(color: Colors.amber), children: [
      TableCell(
          verticalAlignment: TableCellVerticalAlignment.fill,
          child: Container()),
      Container(),
    ]),
  ],
  columnWidths: {
    0: FlexColumnWidth(),
    1: FixedColumnWidth(20),
    3: IntrinsicColumnWidth()
  },
  defaultColumnWidth: FlexColumnWidth(),
  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
  textDirection: null,
  textBaseline: null,
  border: null,
);
