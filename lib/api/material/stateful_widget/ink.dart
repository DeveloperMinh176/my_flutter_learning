import 'package:flutter/material.dart';

import '../stateless_widget/ink_well.dart';

final myInk = Ink(
  color: Colors.amber,
  height: 20,
  width: 20,
  child: myInkWell,
);

final myInkImage = Ink.image(
  fit: BoxFit.cover,
  height: 20,
  width: 20,
  image: NetworkImage('abc'),
  child: myInkWell,
);
