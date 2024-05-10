import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(http.Client client) async {
  final response = await client.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );
  // headers: {HttpHeaders.authorizationHeader: 'Basic your_api_token_here'});
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'userId': int userId, 'id': int id, 'title': String title} =>
        Album(userId: userId, id: id, title: title),
      _ => throw const FormatException()
    };
  }

  Album({required this.userId, required this.id, required this.title});
}

class FetchData extends StatefulWidget {
  final String title;

  const FetchData({super.key, required this.title});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  late Future<Album> _futureAlbum;
  @override
  void initState() {
    _futureAlbum = fetchAlbum(http.Client());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: FutureBuilder(
              future: _futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  Text('${snapshot.error}');
                }
                return CircularProgressIndicator();
              }),
        ));
  }
}
