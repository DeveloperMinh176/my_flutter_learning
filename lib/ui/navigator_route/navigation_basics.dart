import 'package:flutter/cupertino.dart';

class MyNavigationBasics extends StatelessWidget {
  final String title;

  const MyNavigationBasics({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return FirstRoute(
      title: title,
    );
  }
}

class FirstRoute extends StatelessWidget {
  final String title;

  const FirstRoute({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(title),
        ),
        child: Center(
          child: CupertinoButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SecondRoute(
                      title: title,
                    ),
                  ));
            },
            child: Text('Open route'),
          ),
        ));
  }
}

class SecondRoute extends StatelessWidget {
  final String title;

  const SecondRoute({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(title),
        ),
        child: Center(
          child: CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go back'),
          ),
        ));
  }
}
