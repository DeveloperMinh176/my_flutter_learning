import 'package:flutter/material.dart';

var all = BoxDecoration(
  color: Colors.amber,
  gradient: SweepGradient(colors: []),
  image: DecorationImage(image: NetworkImage('')),
  shape: BoxShape.circle,
  border: Border.all(width: 3),
  borderRadius: BorderRadius.all(Radius.circular(5)),
);

class MyBoxDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              fit: BoxFit.contain,
            ),
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.blue, width: 5),
                vertical: BorderSide(color: Colors.blue, width: 5)),
            borderRadius: BorderRadius.circular(8)));
  }
}
