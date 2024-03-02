import 'package:flutter/material.dart';
import 'stateless_widget/container.dart';

var all = Row(
  textDirection: TextDirection.ltr,
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [],
);

class ColumnRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      // Not UI example in API
      textDirection: TextDirection.rtl, // Not UI example in API
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          FlutterLogo(), // Not UI example in API
          Flexible(
              // Not UI example in API
              fit: FlexFit.loose,
              flex: 1,
              child: Text(
                  "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.")),
          Icon(Icons.sentiment_very_satisfied),
        ],
      ),
    );
  }
}
