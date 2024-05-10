import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final myMaterialApp = MaterialApp(
  debugShowMaterialGrid: true,
  showPerformanceOverlay: true,
  color: Colors.amber,
  title: "My MaterialApp",
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('es', 'abc'),
  ],
  theme: ThemeData(),
  darkTheme: ThemeData(),
  themeMode: ThemeMode.light,
  home: Scaffold(),
  routes: {'/': (context) => MaterialApp()},
  initialRoute: '/',
  onGenerateRoute: (settings) =>
      MaterialPageRoute(builder: (_) => MaterialApp()),
  scrollBehavior: MaterialScrollBehavior().copyWith(scrollbars: true),
  debugShowCheckedModeBanner: true,
);
