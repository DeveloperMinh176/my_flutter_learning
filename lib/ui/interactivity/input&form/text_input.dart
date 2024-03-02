import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String title;

  const TextInput({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter a search term'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8.0),
          child: TextFormField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username'),
          ),
        )
      ]),
    );
  }
}
