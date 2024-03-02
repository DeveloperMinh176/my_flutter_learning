import 'package:flutter/material.dart';

class RetrieveInput extends StatefulWidget {
  final String title;

  const RetrieveInput({super.key, required this.title});

  @override
  State<RetrieveInput> createState() => _RetrieveInputState();
}

class _RetrieveInputState extends State<RetrieveInput> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: myController,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.text_fields),
          tooltip: 'Show me the value!',
          onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
              );
            },
          ),
        ));
  }
}
