import 'package:flutter/material.dart';

final myDataTable = DataTable(
  rows: [
    DataRow(
        cells: [DataCell(Text('abc'), showEditIcon: true, placeholder: true)],
        color: MaterialStateProperty.resolveWith((states) => null),
        selected: true,
        onSelectChanged: (value) {}),
  ],
  columns: [
    DataColumn(label: Text('abc')),
  ],
);
