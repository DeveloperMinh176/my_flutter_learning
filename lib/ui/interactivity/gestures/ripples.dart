import 'package:flutter/material.dart';

class Ripples extends StatelessWidget {
  final String title;

  const Ripples({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: InkWell(
              onTap: () {
                const snackBar = SnackBar(content: Text('Tap'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Flat Button'),
              )),
        ));
  }
}
