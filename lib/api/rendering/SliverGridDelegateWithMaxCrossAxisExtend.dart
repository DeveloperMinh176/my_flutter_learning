import 'package:flutter/material.dart';

final mySliverGridDelegateWithMaxCrossAxis =
    SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 50,
  mainAxisSpacing: 10,
  crossAxisSpacing: 20,
  mainAxisExtent: 20,
  childAspectRatio: 1,
);
