import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          BlueBox(),
          BlueBox(),
          BlueBox(),
        ]),
        Row(
          children: [
            BlueBox(),
            Expanded(
              child: BlueBox(),
              flex: 2,
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              child: BlueBox(),
              flex: 3,
              fit: FlexFit.tight,
            ),
            BlueBox(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              "Hey!",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            Text(
              "Hey!",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
            Text(
              "Hey!",
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            Icon(
              Icons.widgets,
              size: 50,
              color: Colors.blue,
            ),
            Icon(
              Icons.widgets,
              size: 50,
              color: Colors.red,
            ),
          ],
        ),
        Image.network(
            "https://raw.githubusercontent.com/flutter/website/main/examples/layout/sizing/images/pic1.jpg"),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.account_circle,
                      size: 50,
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Flutter McFlutter",
                            style: Theme.of(context).textTheme.headline5),
                        const Text("Experienced App Developer")
                      ])
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("123 Main Street"), Text("(451) 555-0198")],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.accessibility),
                  Icon(Icons.timer),
                  Icon(Icons.phone_android),
                  Icon(Icons.phone_iphone)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
    );
  }
}
