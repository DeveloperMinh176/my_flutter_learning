import 'package:flutter/material.dart';

final myBottomNavigationBar = BottomNavigationBar(
  onTap: null,
  currentIndex: 3,
  selectedItemColor: Colors.amber,
  items: [],
);

final myBottomNavigationBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.abc), label: 'ab', backgroundColor: const Color.fromARGB(255, 7, 6, 5));
