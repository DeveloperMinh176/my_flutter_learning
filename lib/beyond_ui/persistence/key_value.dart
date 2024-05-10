import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValue extends StatefulWidget {
  final String title;

  const KeyValue({super.key, required this.title});

  @override
  State<KeyValue> createState() => _KeyValueState();
}

class _KeyValueState extends State<KeyValue> {
  int _counter = 0;

  @override
  void initState() {
    _loadCounter();
    super.initState();
  }

  Future<void> _loadCounter() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _counter = pref.getInt('counter') ?? 0;
    });
  }

  Future<void> _incrementCounter() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _counter = (pref.getInt('counter') ?? 0) + 1;
      pref.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times: '),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
        tooltip: 'Increment',
      ),
    );
  }
}
