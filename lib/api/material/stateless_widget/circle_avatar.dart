import 'package:flutter/material.dart';

final myCircleAvatar = CircleAvatar(
  child: null,
  radius: 2,
  minRadius: 3,
  maxRadius: 4,
  backgroundColor: Colors.amber,
  backgroundImage: NetworkImage("abc"),
  foregroundColor: Colors.amber,
  foregroundImage: NetworkImage("xyz"),
);
