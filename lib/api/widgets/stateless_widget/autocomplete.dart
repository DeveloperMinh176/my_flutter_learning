import 'package:flutter/material.dart';

final myAutocomplete = Autocomplete<String>(
  displayStringForOption: (option) {
    return 'Option: ${option}';
  },
  fieldViewBuilder: (context, textEditingController, focusNode, voidCalkback) {
    return TextFormField();
  },
  optionsBuilder: (textEditingValue) {
    return [];
  },
  optionsViewBuilder: (context, onSelected, options) {
    return ListView();
  },
  onSelected: (option) {
    print(option);
  },
);
