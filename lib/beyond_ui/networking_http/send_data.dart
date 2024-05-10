import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title) async {
  final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }));
  if (response.statusCode == 201) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int id;
  final String title;

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'id': int id, 'title': String title} => Album(id: id, title: title),
      _ => throw const FormatException()
    };
  }

  Album({required this.id, required this.title});
}

class SendData extends StatefulWidget {
  final String title;

  const SendData({super.key, required this.title});

  @override
  State<SendData> createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {
  Future<Album>? _futureAlbum;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            child: (_futureAlbum == null)
                ? _buildColumn()
                : buildFutureBuilder()));
  }

  Widget _buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _controller,
        ),
        ElevatedButton(
            child: Text('Send data'),
            onPressed: () => setState(
                  (() {
                    _futureAlbum = createAlbum(_controller.text);
                  }),
                )),
      ],
    );
  }

  Widget buildFutureBuilder() {
    return FutureBuilder(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        });
  }
}
