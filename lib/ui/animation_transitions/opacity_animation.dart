import 'dart:math';

import 'package:flutter/material.dart';

class MyOpacityAnimation extends StatefulWidget {
  final String title;

  const MyOpacityAnimation({super.key, required this.title});
  @override
  State<MyOpacityAnimation> createState() => _MyOpacityAnimationState();
}

class _MyOpacityAnimationState extends State<MyOpacityAnimation> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: InkWell(
              onTap: () {},
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        child: Icon(Icons.flip),
      ),
    );
  }
}
