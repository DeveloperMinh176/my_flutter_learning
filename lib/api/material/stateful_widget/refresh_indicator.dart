import 'package:flutter/material.dart';

final myRefreshIndicator = RefreshIndicator(
  key: GlobalKey(),
  child: Container(),
  onRefresh: () {
    return Future<void>.delayed(Duration.zero);
  },
  color: Colors.amber,
  backgroundColor: Colors.amber,
  strokeWidth: 3,
  displacement: 20,
  edgeOffset: 20,
  triggerMode: RefreshIndicatorTriggerMode.anywhere,
  notificationPredicate: (notification) {
    return notification.depth == 1;
  },
);
