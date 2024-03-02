import 'package:flutter/material.dart';

class Validation extends StatefulWidget {
  final String title;

  const Validation({super.key, required this.title});

  @override
  State<Validation> createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () => {
                  if (_formKey.currentState!.validate())
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Processing data'),
                      ))
                    }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
