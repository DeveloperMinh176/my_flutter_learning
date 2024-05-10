import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  final String title;

  const LogoApp({super.key, required this.title});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation animation;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
    controller.forward();
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
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: animation.value,
            height: animation.value,
            child: FlutterLogo(),
          ),
        ));
  }
}

class LogoApp1 extends StatefulWidget {
  final String title;

  const LogoApp1({super.key, required this.title});

  @override
  State<LogoApp1> createState() => _LogoAppState1();
}

class _LogoAppState1 extends State<LogoApp1> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    super.initState();
    controller.forward();
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
      body: AnimatedLogo(animation: animation),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);
  static final _opacityTween = Tween<double>(begin: 0, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.animate(animation).value,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: _sizeTween.animate(animation).value,
          height: _sizeTween.animate(animation).value,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

class LogoApp2 extends StatefulWidget {
  final String title;

  const LogoApp2({super.key, required this.title});

  @override
  State<LogoApp2> createState() => _LogoAppState2();
}

class _LogoAppState2 extends State<LogoApp2> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    super.initState();
    controller.forward();
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
      body: GrowTransition(animation: animation),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Animation<double> animation;
  const GrowTransition({super.key, required this.animation});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Center(
            child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: animation.value,
          height: animation.value,
          child: AnimatedLogo2(),
        ));
      },
    );
  }
}

class AnimatedLogo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogo();
  }
}
