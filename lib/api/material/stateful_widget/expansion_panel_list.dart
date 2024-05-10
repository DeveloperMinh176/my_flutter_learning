import 'package:flutter/material.dart';

final myExpansionPanelList = ExpansionPanelList(
    children: [
      ExpansionPanel(
        headerBuilder: (context, isExpanded) {
          return ListTile();
        },
        body: ListTile(),
        isExpanded: true,
      ),
    ],
    dividerColor: Colors.amber,
    elevation: 2,
    expansionCallback: (panelIndex, isExpanded) {},
    expandedHeaderPadding: EdgeInsets.all(8),
    animationDuration: Duration(seconds: 2));
