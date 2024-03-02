import 'package:flutter/material.dart';

class MyHandlingTaps extends StatelessWidget {
  final String title;

  const MyHandlingTaps({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: GestureDetector(
            onTap: () {
              const snackBar = SnackBar(
                content: Text('Tap'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('My Button')),
          ),
        ));
  }
}
