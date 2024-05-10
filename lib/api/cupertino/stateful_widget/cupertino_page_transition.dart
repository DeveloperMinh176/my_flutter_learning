import 'package:flutter/cupertino.dart';

class MyCupertinoPageTransition extends StatefulWidget {
  const MyCupertinoPageTransition({super.key});

  @override
  State<MyCupertinoPageTransition> createState() =>
      _MyCupertinoPageTransitionState();
}

class _MyCupertinoPageTransitionState extends State<MyCupertinoPageTransition>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CupertinoFullscreenDialogTransition(
      primaryRouteAnimation:
          AnimationController(vsync: this, duration: Duration(seconds: 2)),
      secondaryRouteAnimation:
          AnimationController(vsync: this, duration: Duration(seconds: 2)),
      linearTransition: true,
      child: Text('abc'),
    );
  }
}
