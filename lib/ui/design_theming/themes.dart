import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme extends StatelessWidget {
  final String title;

  const MyTheme({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            titleLarge:
                GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic),
            bodyMedium: GoogleFonts.merriweather(),
            displaySmall: GoogleFonts.pacifico(),
          ),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple, brightness: Brightness.dark)),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
          child: Container(
              color: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text(
                'Text with a background color',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ))),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.pink, brightness: Brightness.dark)),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
