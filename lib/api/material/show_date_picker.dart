import 'package:flutter/material.dart';

void myShowDatePicker(BuildContext context) {
  showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(2000),
      lastDate: DateTime(2002),
      initialEntryMode: DatePickerEntryMode.calendarOnly);
}
