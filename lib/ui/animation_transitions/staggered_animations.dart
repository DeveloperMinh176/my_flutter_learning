import 'package:flutter/material.dart';

class StaggeredAnimations extends StatefulWidget {
  final String title;

  const StaggeredAnimations({super.key, required this.title});

  @override
  State<StaggeredAnimations> createState() => _StaggeredAnimationsState();
}

class _StaggeredAnimationsState extends State<StaggeredAnimations>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: GestureDetector(
          onTap: () => _playAnimation(),
          child: Center(
              child: Container(
                  width: 300,
                  height: 300,
                  child: StaggerAnimation(controller: controller.view),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(
                        color: Colors.black45,
                        width: 1,
                      ))))),
    );
  }

  Future<void> _playAnimation() async {
    try {
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
    } on TickerCanceled {
      // The animation got canceled, probably because we were disposed.
    }
  }
}

class StaggerAnimation extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<BorderRadius?> borderRadius;
  final Animation<Color?> color;
  final Animation<double> opacity;
  final Animation<EdgeInsets> padding;

  StaggerAnimation({super.key, required this.controller})
      : width = Tween<double>(
          begin: 50.0,
          end: 150.0,
        ).animate(CurvedAnimation(
            curve: Interval(0.125, 0.250, curve: Curves.ease),
            parent: controller)),
        height = Tween<double>(
          begin: 50.0,
          end: 150.0,
        ).animate(CurvedAnimation(
            curve: Interval(0.250, 0.375, curve: Curves.ease),
            parent: controller)),
        opacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(CurvedAnimation(
            curve: Interval(0, 0.100, curve: Curves.ease), parent: controller)),
        borderRadius = BorderRadiusTween(
          begin: BorderRadius.circular(4),
          end: BorderRadius.circular(75),
        ).animate(CurvedAnimation(
            curve: Interval(0.375, 0.500, curve: Curves.ease),
            parent: controller)),
        color = ColorTween(
          begin: Colors.indigo[100],
          end: Colors.orange[400],
        ).animate(CurvedAnimation(
            curve: Interval(0.500, 0.750, curve: Curves.ease),
            parent: controller)),
        padding = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 16),
          end: EdgeInsets.only(bottom: 75),
        ).animate(CurvedAnimation(
            curve: Interval(0.375, 0.500, curve: Curves.ease),
            parent: controller));

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
        padding: padding.value,
        alignment: Alignment.bottomCenter,
        child: Opacity(
          opacity: opacity.value,
          child: Container(
            width: width.value,
            height: height.value,
            decoration: BoxDecoration(
                color: color.value,
                borderRadius: borderRadius.value,
                border: Border.all(
                  width: 3,
                  color: Colors.indigo,
                )),
          ),
        ));
  }
}
