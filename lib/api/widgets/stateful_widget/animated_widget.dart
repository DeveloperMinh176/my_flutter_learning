import 'package:flutter/material.dart';

class MyAnimationController extends StatefulWidget {
  @override
  State<MyAnimationController> createState() => _MyAnimationControllerState();
}

class _MyAnimationControllerState extends State<MyAnimationController>
    with TickerProviderStateMixin {
  late final controller = AnimationController(
    duration: Duration(milliseconds: 1000),
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    final myPositionedTransition = PositionedTransition(
      rect: RelativeRectTween(
              begin: RelativeRect.fromSize(
                  Rect.fromLTWH(0, 0, 100, 100), Size(100, 100)),
              end: RelativeRect.fromSize(
                  Rect.fromLTWH(0, 0, 100, 100), Size(200, 200)))
          .animate(controller),
      child: Container(),
    );
    final myRelativePositionedTransition = RelativePositionedTransition(
      size: Size(200, 200),
      rect: RectTween(
        begin: Rect.fromLTWH(0, 0, 100, 100),
        end: Rect.fromLTWH(0, 0, 100, 100),
      ).animate(controller),
      child: Container(),
    );
    final myDecoratedBoxTransition = DecoratedBoxTransition(
      decoration: DecorationTween(begin: BoxDecoration(), end: BoxDecoration())
          .animate(controller),
      child: Container(),
    );
    final myAnimatedModalBarrier = AnimatedModalBarrier(
      color: ColorTween(begin: Colors.amber, end: Colors.amber)
          .animate(controller),
      dismissible: true,
    );
    final myDefaultTextStyleTransition = DefaultTextStyleTransition(
      style: TextStyleTween(begin: TextStyle(), end: TextStyle())
          .animate(controller),
      child: Container(),
    );

    final myAlignTransition = AlignTransition(
      alignment: Tween<AlignmentGeometry>(
              begin: Alignment.bottomCenter, end: Alignment.bottomCenter)
          .animate(controller),
      child: Container(),
    );
    final mySlideTransition = SlideTransition(
      position: Tween<Offset>(begin: Offset(0, 0), end: Offset(2, 3))
          .animate(controller),
      child: Container(),
    );
    final mySizeTransition = SizeTransition(
      sizeFactor: controller,
      axis: Axis.horizontal,
      axisAlignment: -1,
      child: Container(),
    );
    final myRotationTransition = RotationTransition(
      turns: controller,
      child: Container(),
    );
    final myScaleTransition = ScaleTransition(
      scale: controller,
      child: Container(),
    );
    final myFadeTransition = FadeTransition(
      opacity: controller,
      child: Container(),
    );

    final myAnimatedBuilder = AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(angle: 3, child: child);
      },
      child: Container(),
    );
    throw UnimplementedError();
  }
}
