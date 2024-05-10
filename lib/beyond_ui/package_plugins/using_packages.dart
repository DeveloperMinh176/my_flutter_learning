import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';

class UsingPackages extends StatelessWidget {
  final String title;

  const UsingPackages({super.key, required this.title});

  void launchURL() {
    launchUrl(p.toUri('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
          child: ElevatedButton(
              child: Text('Show Flutter homepage'), onPressed: launchURL)),
    );
  }
}
