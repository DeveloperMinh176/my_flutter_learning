import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final myWidgetsApp = WidgetsApp(
  title: "My MaterialApp",
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('es', 'abc'),
  ],
  home: Scaffold(),
  routes: {'/': (context) => MaterialApp()},
  initialRoute: '/',
  onGenerateRoute: (settings) =>
      MaterialPageRoute(builder: (_) => MaterialApp()),
  debugShowCheckedModeBanner: true,
  color: Colors.black,
);
