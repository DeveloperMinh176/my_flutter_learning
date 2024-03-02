import 'package:flutter/material.dart';

class OrientationDemo extends StatelessWidget {
  final name = 'Minh An';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OrientationBuilder(
      builder: ((context, orientation) => orientation == Orientation.portrait
          ? _buildVerticalLayout()
          : _buildHorizontalLayout()),
    ));
  }

  Widget _buildVerticalLayout() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Icon(Icons.account_circle, size: 100),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 32),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            'Demo Data',
            style: TextStyle(fontSize: 32),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            'Demo Data',
            style: TextStyle(fontSize: 32),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            'Demo Data',
            style: TextStyle(fontSize: 32),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            'Demo Data',
            style: TextStyle(fontSize: 32),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            'Demo Data',
            style: TextStyle(fontSize: 32),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            'Demo Data',
            style: TextStyle(fontSize: 32),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      children: [
        Expanded(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Icon(
                Icons.account_circle,
                size: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontSize: 32),
              ),
            )
          ]),
        ),
        Expanded(
            child: Column(
          children: List.generate(
            6,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Demo Data',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
        ))
      ],
    );
  }
}

class MasterDetailPage extends StatefulWidget {
  @override
  State<MasterDetailPage> createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  bool isLargeScreen = true;
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Master Detail Page')),
        body: OrientationBuilder(
          builder: (context, orientation) {
            final deviceWidth = MediaQuery.of(context).size.width;
            if (deviceWidth > 600) {
              isLargeScreen = true;
            } else {
              isLargeScreen = false;
            }
            return Row(
              children: [
                Expanded(
                  child: ListWidget(10, (value) {
                    if (isLargeScreen) {
                      selectedValue = value;
                      setState(() {});
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(value)));
                    }
                  }),
                ),
                isLargeScreen
                    ? Expanded(child: DetailWidget(selectedValue))
                    : Container(),
              ],
            );
          },
        ));
  }
}

class DetailPage extends StatefulWidget {
  final int data;
  DetailPage(this.data);
  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DetailWidget(widget.data),
    );
  }
}

class DetailWidget extends StatefulWidget {
  final int data;
  DetailWidget(this.data);

  @override
  State<StatefulWidget> createState() {
    return _DetailWidgetState();
  }
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Center(
            child:
                Text(widget.data.toString(), style: TextStyle(fontSize: 32))));
  }
}

typedef Null itemSelectedCallback(int value);

class ListWidget extends StatefulWidget {
  final int count;
  final itemSelectedCallback onItemSelected;
  ListWidget(this.count, this.onItemSelected);
  @override
  State<StatefulWidget> createState() {
    return _ListWidgetState();
  }
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.count,
        itemBuilder: (context, position) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: InkWell(
                    onTap: () {
                      widget.onItemSelected(position);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(position.toString(),
                          style: TextStyle(fontSize: 22)),
                    )),
              ),
            ));
  }
}
