import 'package:flutter/material.dart';

final myAppBar = AppBar(
  leading: null,
  actions: [Icon(Icons.add_alert_outlined)],
  flexibleSpace: FlexibleSpaceBar(),
  title: Text("Title"),
  bottom: null,
  shadowColor: null,
  scrolledUnderElevation: 4.0,
  titleTextStyle: TextStyle(),
  backgroundColor: Colors.amber,
  foregroundColor: Colors.amber,
  clipBehavior: Clip.hardEdge,
  elevation: 20,
  iconTheme: IconThemeData(color: Colors.amber),
  notificationPredicate: (ScrollNotification notification) =>
      notification.depth == 1,
);
