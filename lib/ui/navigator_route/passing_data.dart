import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo({required this.title, required this.description});
}

class MyPassingData extends StatelessWidget {
  final String title;

  const MyPassingData({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TodosScreen(
      title: title,
      children: List.generate(
          20,
          (index) => Todo(
              title: 'Todo $index',
              description:
                  'A description of what needs to be done for Todo $index')),
    );
  }
}

class TodosScreen extends StatelessWidget {
  final String title;
  final List<Todo> children;

  const TodosScreen({super.key, required this.title, required this.children});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              final todo = children[index];
              return ListTile(
                title: Text(todo.title),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailScreen();
                        },
                        settings: RouteSettings(arguments: todo),
                      ));
                },
              );
            }));
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context)!.settings.arguments as Todo;

    return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(todo.description),
        ));
  }
}
