import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MyFadingInImage extends StatelessWidget {
  final String title;

  const MyFadingInImage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Stack(children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          Center(
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://picsum.photos/250?image=9'),
          ),
        ]));
  }
}

class MyFadingInImage2 extends StatelessWidget {
  final String title;

  const MyFadingInImage2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: FadeInImage.assetNetwork(
            placeholder: 'images/loading.gif',
            image: 'https://picsum.photos/250?image=9'),
      ),
    );
  }
}
