import 'package:flutter/material.dart';

void myShowModalButtonSheet(BuildContext context) => showModalBottomSheet(
    context: context,
    builder: (context) => BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container();
          },
        ));
void myShowBottomSheet(BuildContext context) => showBottomSheet(
    context: context,
    builder: (context) => BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container();
          },
        ));
