import 'package:flutter/material.dart';

class TextFieldChanges extends StatefulWidget {
  final String title;

  const TextFieldChanges({super.key, required this.title});

  @override
  State<TextFieldChanges> createState() => _TextFieldChangesState();
}

class _TextFieldChangesState extends State<TextFieldChanges> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(_printLastestValue);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }

  void _printLastestValue() {
    final text = _controller.text;
    print('Second text field: $text (${text.characters.length})');
  }
}
