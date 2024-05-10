import 'package:flutter/material.dart';

final myStepper = Stepper(
  currentStep: 1,
  onStepTapped: (value) {},
  onStepCancel: () {},
  onStepContinue: () {},
  steps: [
    Step(
        title: Text('abc'),
        content: Container(
          child: Text('abc'),
        ))
  ],
);
