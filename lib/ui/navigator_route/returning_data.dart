import 'package:flutter/material.dart';

class MyReturningData extends StatelessWidget {
  final String title;

  const MyReturningData({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(child: SelectionButton()));
  }
}

class SelectionButton extends StatefulWidget {
  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Pick an option, any option!'),
      onPressed: () => navigateAndDisplaySelection(),
    );
  }

  Future<void> navigateAndDisplaySelection() async {
    final result = await Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return SelectionScreen();
      },
    ));

    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: Text('$result'),
      ));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Selection Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    child: Text('Yet!'),
                    onPressed: () {
                      Navigator.pop(context, 'Yep!');
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text('Nope!'),
                  onPressed: () {
                    Navigator.pop(context, 'Nope.');
                  },
                ),
              )
            ],
          ),
        ));
  }
}
