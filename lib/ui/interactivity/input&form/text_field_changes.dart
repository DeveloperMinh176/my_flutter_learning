import 'package:flutter/material.dart';

class TextFieldChanges extends StatefulWidget {
  final String title;

  const TextFieldChanges({super.key, required this.title});

  @override
  State<TextFieldChanges> createState() => _TextFieldChangesState();
}

class _TextFieldChangesState extends State<TextFieldChanges> {
  final myController = TextEditingController();

  @override
  void initState() {
    myController.addListener(_printLastestValue);
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(onChanged: (text) {
              print('First text field: $text (${text.characters.length})');
            }),
            TextField(
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }

  void _printLastestValue() {
    final text = myController.text;
    print('Second text field: $text (${text.characters.length})');
  }
}
