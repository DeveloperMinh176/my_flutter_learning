import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MixedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyList(
        items: List<ListItem>.generate(
            1000,
            (index) => index % 6 == 0
                ? HeadingItem(title: 'Heading $index')
                : MessageItem(
                    title: 'Sender $index', subtitle: 'Message body $index')));
  }
}

class MyList extends StatelessWidget {
  final List<ListItem> items;

  const MyList({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context));
        });
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class MessageItem implements ListItem {
  final String title;
  final String subtitle;

  MessageItem({required this.title, required this.subtitle});
  @override
  Widget buildSubtitle(BuildContext context) {
    return Text(subtitle);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(title);
  }
}

class HeadingItem implements ListItem {
  final String title;

  HeadingItem({required this.title});

  @override
  Widget buildSubtitle(BuildContext context) {
    return SizedBox.shrink();
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headlineSmall);
  }
}
