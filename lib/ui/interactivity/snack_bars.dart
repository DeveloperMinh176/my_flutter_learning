import 'package:flutter/material.dart';

class SnackBars extends StatelessWidget {
  final String title;

  const SnackBars({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
            child: ElevatedButton(
                child: Text('Show SnackBar'),
                onPressed: () {
                  final snackBar = SnackBar(
                      content: Text('Yay! A SnackBar'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                })));
  }
}
