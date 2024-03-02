import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  final String title;

  const MyDrawer({super.key, required this.title});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOption = [
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];
  int _selectedIndex = 0;

  void _onItemTaped(index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(child: _widgetOption[_selectedIndex]),
        drawer: Drawer(
          child: ListView(children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
                title: Text('Index 0: Home'),
                selected: _selectedIndex == 0,
                onTap: () {
                  Navigator.pop(context);
                  _onItemTaped(0);
                }),
            ListTile(
                title: Text('Index 1: Business'),
                selected: _selectedIndex == 1,
                onTap: () {
                  Navigator.pop(context);
                  _onItemTaped(1);
                }),
            ListTile(
                title: Text('Index 2: Home'),
                selected: _selectedIndex == 2,
                onTap: () {
                  Navigator.pop(context);
                  _onItemTaped(2);
                }),
          ]),
        ));
  }
}
