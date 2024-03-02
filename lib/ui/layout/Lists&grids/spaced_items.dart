import 'package:flutter/material.dart';

class SpacedItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const items = 4;
    return Theme(
      data: ThemeData(
          cardTheme: CardTheme(color: Colors.blue.shade50),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          items,
                          (index) => ItemWidget(
                                text: 'Item $index',
                              ))),
                ),
              )),
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 150,
        child: Center(child: Text(text)),
      ),
    );
  }
}
