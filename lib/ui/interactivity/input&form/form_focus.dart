import 'package:flutter/material.dart';

class FormFocus extends StatefulWidget {
  final String title;

  const FormFocus({super.key, required this.title});

  @override
  State<FormFocus> createState() => _FormFocusState();
}

class _FormFocusState extends State<FormFocus> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
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
              TextField(
                focusNode: myFocusNode,
              ),
              TextField(autofocus: true),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () => {
            myFocusNode.requestFocus(),
          },
        ));
  }
}
