import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuildALayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ImageSection(image: 'images/lake.jpg'),
        TitleSection(
            name: 'Oeschinen Lake Campground',
            location: 'Kandersteg, Switzerland'),
        ButtonSection(),
        TextSection(
            description:
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                'Bernese Alps. Situated 1,578 meters above sea level, it '
                'is one of the larger Alpine Lakes. A gondola ride from '
                'Kandersteg, followed by a half-hour walk through pastures '
                'and pine forest, leads you to the lake, which warms to 20 '
                'degrees Celsius in the summer. Activities enjoyed here '
                'include rowing, and riding the summer toboggan run.'),
      ]),
    );
  }
}

class TextSection extends StatelessWidget {
  final String description;

  const TextSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(description, softWrap: true),
    );
  }
}

class ButtonSection extends StatelessWidget {
  ButtonSection({super.key});
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(icon: Icons.call, color: color, label: "CALL"),
          ButtonWithText(icon: Icons.near_me, color: color, label: "ROUTE"),
          ButtonWithText(icon: Icons.share, color: color, label: "SHARE"),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  final Color color;

  final String label;

  final IconData icon;

  const ButtonWithText(
      {super.key,
      required this.color,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  final String name;
  final String location;

  const TitleSection({super.key, required this.name, required this.location});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  State<FavoriteWidget> createState() {
    return _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  int _favoriteCount = 41;
  bool _isFavorite = true;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
        _favoriteCount -= 1;
      } else {
        _isFavorite = true;
        _favoriteCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _toggleFavorite,
          icon: Icon(_isFavorite ? Icons.star : Icons.star_outline,
              color: Colors.red),
        ),
        Text('$_favoriteCount')
      ],
    );
  }
}
