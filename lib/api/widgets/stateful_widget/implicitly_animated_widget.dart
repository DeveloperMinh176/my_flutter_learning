import 'package:flutter/material.dart';

final myAnimatedAlign = AnimatedAlign(
  alignment: Alignment.bottomCenter,
  child: Container(),
  duration: Duration(seconds: 3),
  curve: Curves.linear,
);

final myAnimatedDefaultTextStyle = AnimatedDefaultTextStyle(
  style: TextStyle(color: Colors.amber),
  child: Container(),
  duration: Duration(seconds: 3),
  curve: Curves.linear,
);

final myAnimatedScale = AnimatedScale(
  duration: Duration(seconds: 3),
  curve: Curves.linear,
  scale: 0.5,
  alignment: Alignment.bottomCenter,
  child: null,
);
final myAnimatedRotation = AnimatedRotation(
  duration: Duration(seconds: 3),
  curve: Curves.linear,
  turns: 3,
  alignment: Alignment.bottomCenter,
  child: null,
);

final myAnimatedSlide = AnimatedSlide(
  duration: Duration(seconds: 3),
  curve: Curves.linear,
  offset: Offset(0, 0),
  child: null,
);

final myAnimatedOpacity = AnimatedOpacity(
  opacity: 1,
  curve: Curves.linear,
  duration: const Duration(seconds: 3),
  child: const FlutterLogo(),
);
final myAnimatedPadding = AnimatedPadding(
  padding: EdgeInsets.all(2),
  duration: const Duration(seconds: 2),
  curve: Curves.easeInOut,
  child: Container(),
);
final myAnimatedPositioned = AnimatedPositioned(
  width: 50.0,
  height: 200.0,
  top: 150.0,
  bottom: 200,
  left: 20,
  right: 10,
  duration: const Duration(seconds: 2),
  curve: Curves.fastOutSlowIn,
  child: Container(),
);
final myAnimatedSize = AnimatedSize(
  curve: Curves.easeIn,
  duration: const Duration(seconds: 1),
  child: FlutterLogo(),
);

final myAnimatedContainer = AnimatedContainer(
  decoration: BoxDecoration(),
  constraints: BoxConstraints(),
  margin: EdgeInsets.all(0),
  padding: EdgeInsets.symmetric(),
  color: Color(0xFFFFFFFF),
  alignment: Alignment.center,
  transform: Matrix4.rotationZ(2.0),
  width: 50,
  height: 50,
  child: Center(child: Text('Hello')),
  clipBehavior: Clip.hardEdge,
  duration: Duration(milliseconds: 20),
  curve: Curves.easeInOut,
);

final myTweenAnimationBuilder = TweenAnimationBuilder(
  tween: Tween(begin: 0, end: 1),
  builder: (context, value, child) {
    return Container();
  },
  duration: Duration(milliseconds: 20),
  curve: Curves.easeInOut,
);

final mySliverAnimatedOpacity = SliverAnimatedOpacity(
  sliver: SliverList.builder(itemBuilder: (context, i) => Text('$i')),
  opacity: 1,
  duration: Duration(milliseconds: 3),
  curve: Curves.easeInOut,
);

final myAnimatedFractionallySizedBox = AnimatedFractionallySizedBox(
  widthFactor: 200,
  heightFactor: 100,
  child: null,
  alignment: Alignment.bottomCenter,
  duration: Duration(milliseconds: 3),
  curve: Curves.easeInOut,
);

final myAnimatedSwitcher = AnimatedSwitcher(
  duration: Duration(seconds: 3),
  child: null,
  switchInCurve: Curves.easeInOut,
  switchOutCurve: Curves.easeInOut,
  transitionBuilder: (child, animation) {
    return ScaleTransition(scale: animation, child: child);
  },
);

final myAnimatedPositionedDirectional = AnimatedPositionedDirectional(
  width: 50.0,
  height: 200.0,
  top: 150.0,
  bottom: 200,
  start: 20,
  end: 10,
  duration: const Duration(seconds: 2),
  curve: Curves.fastOutSlowIn,
  child: Container(),
);

final myAnimatedPhysicalModel = AnimatedPhysicalModel(
  child: Container(),
  color: Colors.black,
  shadowColor: Colors.black,
  shape: BoxShape.circle,
  elevation: 3,
  borderRadius: BorderRadius.circular(8),
  duration: const Duration(seconds: 2),
  curve: Curves.fastOutSlowIn,
);

final myAnimatedTheme = AnimatedTheme(
  child: Container(),
  data: ThemeData(),
  duration: const Duration(seconds: 2),
  curve: Curves.fastOutSlowIn,
);

final myAnimatedCrossFade = AnimatedCrossFade(
  crossFadeState: true ? CrossFadeState.showFirst : CrossFadeState.showSecond,
  duration: const Duration(seconds: 2),
  firstChild: Text('abc'),
  secondChild: Text('abc'),
  firstCurve: Curves.bounceIn,
  secondCurve: Curves.bounceIn,
  sizeCurve: Curves.bounceIn,
);

final myAnimatedList = AnimatedList(
  key: Key('abc'),
  initialItemCount: 100,
  itemBuilder: (context, index, animation) {
    return Text('abc');
  },
);
