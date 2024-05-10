import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math' as math;

class HeroPhoto extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const HeroPhoto(
      {super.key,
      required this.photo,
      required this.onTap,
      required this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimations extends StatelessWidget {
  final String title;

  const HeroAnimations({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: HeroPhoto(
            photo: 'images/pic0.jpg',
            width: 300,
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Scaffold(
                          appBar: AppBar(title: Text(title)),
                          body: Container(
                            color: Colors.lightBlueAccent,
                            padding: EdgeInsets.all(16),
                            alignment: Alignment.topLeft,
                            child: HeroPhoto(
                              photo: 'images/pic0.jpg',
                              width: 100,
                              onTap: () => Navigator.pop(context),
                            ),
                          ))),
                )),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final Widget child;
  final double maxRadius;
  final double clipRectSize;

  const RadialExpansion(
      {super.key, required this.maxRadius, required this.child})
      : clipRectSize = 2 * (maxRadius / math.sqrt2);
  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Center(
      child: SizedBox(
        width: clipRectSize,
        height: clipRectSize,
        child: ClipRRect(child: child),
      ),
    ));
  }
}

class Photo extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  const Photo({super.key, required this.photo, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Material(
      child:
          InkWell(onTap: onTap, child: Image.asset(photo, fit: BoxFit.contain)),
    );
  }
}

class HeroAnimations1 extends StatelessWidget {
  const HeroAnimations1({super.key, required this.title});

  final String title;
  static double kMinRadius = 32;
  static double kMaxRadius = 128;
  static Interval opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(
      begin: begin,
      end: end,
    );
  }

  Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: kMaxRadius * 2.0,
                  height: kMaxRadius * 2.0,
                  child: Hero(
                    createRectTween: _createRectTween,
                    tag: imageName,
                    child: RadialExpansion(
                      maxRadius: kMaxRadius,
                      child: Photo(
                          photo: imageName,
                          onTap: () => Navigator.pop(context)),
                    ),
                  ),
                ),
                Text(
                  description,
                  textScaler: TextScaler.linear(3),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                )
              ],
            )),
      ),
    );
  }

  Widget _buildHero(
    BuildContext context,
    String image,
    String description,
  ) {
    return SizedBox(
      width: kMinRadius * 2,
      height: kMinRadius * 2,
      child: Hero(
        createRectTween: _createRectTween,
        tag: image,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
              photo: image,
              onTap: () => Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget? child) {
                          return Opacity(
                              opacity: opacityCurve.transform(animation.value),
                              child: _buildPage(context, image, description));
                        },
                      );
                    },
                  ))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Container(
          padding: EdgeInsets.all(32),
          alignment: Alignment.bottomCenter,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _buildHero(context, 'images/pic0.jpg', 'Chair'),
            _buildHero(context, 'images/pic1.jpg', 'Binoculars'),
            _buildHero(context, 'images/pic2.jpg', 'Beach ball'),
          ]),
        ));
  }
}
