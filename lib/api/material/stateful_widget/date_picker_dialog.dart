import 'package:flutter/material.dart';

final myDatePickerDialog = DatePickerDialog(
  restorationId: 'myDatePickerDialog',
  initialEntryMode: DatePickerEntryMode.calendarOnly,
  firstDate: DateTime(2000),
  lastDate: DateTime(2002),
);
