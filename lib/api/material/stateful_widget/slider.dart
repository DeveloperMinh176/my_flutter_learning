import 'package:flutter/material.dart';

final mySlider = Slider(
  key: Key('abc'),
  value: 30,
  divisions: 100,
  max: 200,
  secondaryTrackValue: 2,
  thumbColor: Colors.black,
  activeColor: Colors.black,
  label: 'abc',
  onChangeStart: (value) {},
  onChangeEnd: (value) {},
  onChanged: (value) {},
);

final mySliderAdaptive = Slider.adaptive(
  key: Key('abc'),
  value: 30,
  divisions: 100,
  max: 200,
  secondaryTrackValue: 2,
  thumbColor: Colors.black,
  activeColor: Colors.black,
  label: 'abc',
  onChangeStart: (value) {},
  onChangeEnd: (value) {},
  onChanged: (value) {},
);
