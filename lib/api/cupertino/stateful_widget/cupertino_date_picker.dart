import 'package:flutter/cupertino.dart';

void myCupertinoDatePicker(BuildContext context) {
  showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
            height: 256,
            padding: EdgeInsets.only(top: 6),
            margin: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: CupertinoDatePicker(
                initialDateTime: DateTime(2016, 12, 12, 12, 43),
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                showDayOfWeek: true,
                onDateTimeChanged: (value) {},
              ),
            ),
          ));
}
