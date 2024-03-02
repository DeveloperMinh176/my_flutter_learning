import 'package:flutter/material.dart';

var all = Container(
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
);

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        // Not UI example in API
        height:
            Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 + 200.0,
      ),
      alignment: FractionalOffset(0.5, 0.5), // Not UI example in API
      color: Colors.blue, // Not UI example in API
      padding: EdgeInsets.all(8.0), // Not UI example in API
      transform: Matrix4.rotationZ(0.1), // Not UI example in API
      child: Text('Hello World',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Color.fromRGBO(255, 255, 255, 1))), // Not UI(code) example
    );
  }
}
