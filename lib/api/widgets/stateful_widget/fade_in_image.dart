import 'package:flutter/widgets.dart';

final myFadeInImage = FadeInImage(
  image: NetworkImage('abc'),
  placeholder: NetworkImage('abc'),
  fadeInCurve: Curves.easeIn,
  fadeOutDuration: Duration(milliseconds: 1000),
  height: 200,
);
