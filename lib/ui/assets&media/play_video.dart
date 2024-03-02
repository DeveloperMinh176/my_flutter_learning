import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyPlayVideo extends StatefulWidget {
  final String title;

  const MyPlayVideo({super.key, required this.title});

  @override
  State<MyPlayVideo> createState() => _MyPlayVideoState();
}

class _MyPlayVideoState extends State<MyPlayVideo> {
  late final VideoPlayerController _controller;
  late final Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    ));

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPlaying = _controller.value.isPlaying;
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        floatingActionButton: FloatingActionButton(
            child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            }));
  }
}
