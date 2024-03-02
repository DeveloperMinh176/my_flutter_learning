import 'package:flutter/material.dart';

class MyNetworkImage extends StatelessWidget {
  final String title;

  const MyNetworkImage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Image.network(
            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'));
  }
}
