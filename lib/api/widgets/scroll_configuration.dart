import 'package:flutter/widgets.dart';

myScrollConfiguration(BuildContext context) => ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
      child: ListView(),
    );
