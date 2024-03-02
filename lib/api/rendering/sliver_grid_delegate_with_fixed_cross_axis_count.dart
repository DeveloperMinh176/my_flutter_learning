import 'package:flutter/material.dart';

final mySliverGridDelegateWithFixedCrossAxisCount =
    SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3,
  mainAxisSpacing: 10,
  crossAxisSpacing: 20,
  mainAxisExtent: 20,
  childAspectRatio: 1,
);
