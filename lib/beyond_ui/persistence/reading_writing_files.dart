import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterStorage {
  const CounterStorage();
  Future<String> get _loadPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _loadFile async {
    final path = await _loadPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _loadFile;
      final content = await file.readAsString();
      return int.parse(content);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _loadFile;
    return file.writeAsString(counter.toString());
  }
}

class ReadingWritingFiles extends StatefulWidget {
  final String title;
  final CounterStorage storage = const CounterStorage();

  const ReadingWritingFiles({super.key, required this.title});

  @override
  State<ReadingWritingFiles> createState() => _ReadingWritingFilesState();
}

class _ReadingWritingFilesState extends State<ReadingWritingFiles> {
  int _counter = 0;

  @override
  void initState() {
    widget.storage
        .readCounter()
        .then((value) => setState((() => _counter = value)));
    super.initState();
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
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
