import 'package:flutter/cupertino.dart';

class MyCupertinoFullscreenDialogTransition extends StatefulWidget {
  const MyCupertinoFullscreenDialogTransition({super.key});

  @override
  State<MyCupertinoFullscreenDialogTransition> createState() =>
      _MyCupertinoFullscreenDialogTransitionState();
}

class _MyCupertinoFullscreenDialogTransitionState
    extends State<MyCupertinoFullscreenDialogTransition>
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
