import 'package:flutter/material.dart';

final myAnimatedContainer = AnimatedContainer(
  decoration: BoxDecoration(),
  constraints: BoxConstraints(),
  margin: EdgeInsets.all(0),
  padding: EdgeInsets.symmetric(),
  color: Color(0xFFFFFFFF),
  alignment: Alignment.center,
  transform: Matrix4.rotationZ(2.0),
  width: 50,
  height: 50,
  child: Center(child: Text('Hello')),
  clipBehavior: Clip.hardEdge,
  duration: Duration(milliseconds: 20),
  curve: Curves.easeInOut,
);
