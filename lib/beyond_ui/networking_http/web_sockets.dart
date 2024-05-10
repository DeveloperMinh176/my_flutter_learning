import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MyWebSockets extends StatefulWidget {
  final String title;

  const MyWebSockets({super.key, required this.title});

  @override
  State<MyWebSockets> createState() => _MyWebSocketsState();
}

class _MyWebSocketsState extends State<MyWebSockets> {
  final TextEditingController _controller = TextEditingController();
  final WebSocketChannel _channel =
      WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.send),
          onPressed: () => sendMessage(),
          tooltip: 'Send a message'),
    );
  }

  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }
}
