import 'package:flutter/material.dart';
import 'ui/navigator_route/drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: LogoScale(
          //title: _title,
          ),
    );
  }
}

class LogoScale extends StatefulWidget {
  const LogoScale({super.key});

  @override
  State<LogoScale> createState() => LogoScaleState();
}

class LogoScaleState extends State<LogoScale> {
  double scale = 1.0;

  void _changeScale() {
    setState(() => scale = scale == 1.0 ? 3.0 : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _changeScale,
          child: const Text('Scale Logo'),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(seconds: 2),
            child: const FlutterLogo(),
          ),
        ),
      ],
    );
  }
}
