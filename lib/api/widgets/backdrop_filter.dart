import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'dart:ui';

final myBackdropFilter = BackdropFilter(
  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
  child: Container(),
);

final myImageFiltered = ImageFiltered(
  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
  child: Container(),
);
