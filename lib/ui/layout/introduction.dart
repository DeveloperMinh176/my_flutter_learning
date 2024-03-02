import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String appTitle = "Flutter layout demo";

final myMaterialApp = MaterialApp(
    title: appTitle,
    home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Center(
          child: Text("Hello World"),
        )));

final myCupertinoApp = CupertinoApp(
    title: "Flutter layout demo",
    theme: CupertinoThemeData(
        brightness: Brightness.light, primaryColor: CupertinoColors.systemBlue),
    home: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGrey,
          middle: Text('Flutter layout demo')),
      child: Center(child: Text("Hello World")),
    ));

final myCupertinoTabScaffold = CupertinoTabScaffold(
    tabBar: CupertinoTabBar(
      items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.add), label: 'Add'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.alarm), label: 'Alarm'),
      ],
    ),
    tabBuilder: (BuildContext context, int index) {
      return CupertinoTabView(
        builder: (context) {
          if (index == 0) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Add'),
              ),
              child: Center(child: Text('Add')),
            );
          } else {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(middle: Text('Alarm')),
              child: Center(
                child: Text('Alarm',
                    style: TextStyle(color: CupertinoColors.activeBlue)),
              ),
            );
          }
        },
      );
    });

final myNonMaterial = Container(
    decoration: const BoxDecoration(color: Colors.white),
    child: const Center(
      child: Text("Hello World",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 32, color: Colors.black87)),
    ));

final myWidget = Column(children: [
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(child: Image.asset("images/pic1.jpg")),
      Expanded(flex: 2, child: Image.asset("images/pic2.jpg")),
      Expanded(child: Image.asset("images/pic3.jpg"))
    ],
  )
]);

Widget buildHomePage(String title) {
  const titleText = Padding(
    padding: EdgeInsets.all(20),
    child: Text('Strawberry Pavlova',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 0.5)),
  );
  const subTitle = Text(
    'Pavlova is a meringue-based dessert named after the Russian ballerina '
    'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
    'topped with fruit and whipped cream.',
    textAlign: TextAlign.center,
    style: TextStyle(fontFamily: "Georgia", fontSize: 25),
  );
  final mainImage = Image.asset("images/pavlova.jpg");
  final stars = Row(
    children: [
      Icon(Icons.star, color: Colors.green),
      Icon(Icons.star, color: Colors.green),
      Icon(Icons.star, color: Colors.green),
      Icon(Icons.star, color: Colors.black),
      Icon(Icons.star, color: Colors.black),
    ],
  );
  final ratings = Padding(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        stars,
        Text(
          '170 Reviews',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Roboto',
              letterSpacing: 0.5),
        )
      ],
    ),
  );
  final descTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 20,
    height: 2,
  );
  final iconList = DefaultTextStyle.merge(
    style: descTextStyle,
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.kitchen, color: Colors.green),
              Text(
                'PREP:',
              ),
              Text(
                '25 min',
              )
            ],
          ),
          Column(
            children: [
              Icon(Icons.timer, color: Colors.green),
              Text(
                'COOK:\n1 hr',
                textAlign: TextAlign.center,
              )
            ],
          ),
          Column(
            children: [
              Icon(Icons.restaurant, color: Colors.green),
              Text(
                'FEEDS:\n4-6',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      ),
    ),
  );
  final leftColumn = Padding(
    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [titleText, subTitle, ratings, iconList],
    ),
  );
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Padding(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 30),
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 440,
              child: leftColumn,
            ),
            mainImage
          ],
        ),
      ),
    ),
  );
}

class MyLayoutContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black26),
      child: _buildImageColumn(),
    );
  }

  _buildImageColumn() =>
      Column(children: [_buildImageRow(1), _buildImageRow(3)]);

  _buildImageRow(int index) => Row(
      children: [_buildDecoratedImage(index), _buildDecoratedImage(index + 1)]);

  _buildDecoratedImage(int index) => Expanded(
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 10, color: Colors.black38),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(4),
            child: Image.asset('images/pic$index.jpg')),
      );
}

class GridListDemo extends StatelessWidget {
  static const showGrid = true;
  @override
  Widget build(BuildContext context) {
    return showGrid ? _buildGrid() : _buildList();
  }

  Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 1500,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        padding: EdgeInsets.all(4),
        children: _buildGridTileList(30),
      );

  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (index) => Container(
            child: Image.asset(
              'images/pic$index.jpg',
              fit: BoxFit.scaleDown,
            ),
          ));

  Widget _buildList() => ListView(
        children: [
          _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
          _tile('The Castro Theater', '429 Castro St', Icons.theaters),
          _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
          _tile('Roxie Theater', '3117 16th St', Icons.theaters),
          _tile('United Artists Stonestown Twin', '501 Buckingham Way',
              Icons.theaters),
          _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
          const Divider(),
          _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
          _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
          _tile(
              'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
          _tile('La Ciccia', '291 30th St', Icons.restaurant),
        ],
      );

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
        subtitle: Text(subtitle),
        leading: Icon(icon, color: Colors.blue));
  }
}

class CardStack extends StatelessWidget {
  static const showCard = false;
  @override
  Widget build(BuildContext context) {
    return showCard ? _buildCard() : _buildStack();
  }

  Widget _buildCard() {
    return SizedBox(
      height: 210,
      child: Card(
          child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.restaurant_menu, color: Colors.blue[500]),
            title: Text('1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('My City, CA 99984'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.contact_phone, color: Colors.blue[500]),
            title: Text('(408) 555-1212'),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail, color: Colors.blue[500]),
            title: Text('costa@example.com'),
          )
        ],
      )),
    );
  }

  Widget _buildStack() {
    return Stack(
      alignment: Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
            backgroundImage: AssetImage('images/pic0.jpg'), radius: 100),
        Container(
          color: Colors.black45,
          child: Text('Mia B',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        )
      ],
    );
  }
}
