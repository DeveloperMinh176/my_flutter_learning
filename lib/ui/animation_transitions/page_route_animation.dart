import 'package:flutter/material.dart';

class PageRouteAnimation extends StatelessWidget {
  final String title;

  const PageRouteAnimation({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: ElevatedButton(
            child: Text(
              'Go',
            ),
            onPressed: () {
              Navigator.push(context, _createBuilder());
            },
          ),
        ));
  }

  Route<Object?> _createBuilder() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Page2();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(child: child, position: animation.drive(tween));
      },
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Page 2'),
        ));
  }
}
