import 'package:flutter/material.dart';

class UseLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(leading: Icon(Icons.photo_album), title: Text('Album')),
        ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
      ],
    );
  }
}
