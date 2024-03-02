import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/rendering/object.dart';
import 'package:flutter/widgets.dart';

class ExampleParallax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        for (final location in locations)
          LocationListItem(
            name: location.name,
            country: location.place,
            urlImage: location.imageUrl,
          ),
      ]),
    );
  }
}

class LocationListItem extends StatelessWidget {
  LocationListItem(
      {super.key,
      required this.name,
      required this.country,
      required this.urlImage});
  final String name;
  final String country;
  final String urlImage;
  final GlobalKey _backgroundImageKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    print(mediaQuery);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                _buildParallaxBackground(context),
                _buildGradient(),
                _buildTitleAndSubTitle()
              ],
            ),
          ),
        ));
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
        delegate: ParallaxFlowDelegate(
            scrollable: Scrollable.of(context),
            listItemContext: context,
            backgroundImageKey: _backgroundImageKey),
        children: [
          Image.network(key: _backgroundImageKey, urlImage, fit: BoxFit.cover)
        ]);
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                stops: [0.6, 0.95])),
      ),
    );
  }

  Widget _buildTitleAndSubTitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        Text(country, style: TextStyle(fontSize: 14, color: Colors.white))
      ]),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  ParallaxFlowDelegate(
      {required this.scrollable,
      required this.listItemContext,
      required this.backgroundImageKey})
      : super(repaint: scrollable.position);
  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    final viewportDimession = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimession).clamp(0.0, 1);
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = listItemBox.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);
    context.paintChild(0,
        transform:
            Transform.translate(offset: Offset(0, childRect.top)).transform);
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class Parallax extends SingleChildRenderObjectWidget {
  Parallax({super.key, required Widget background}) : super(child: background);
  @override
  RenderObject createRenderObject(BuildContext context) {
    return ParallaxRenderObject(scrollable: Scrollable.of(context));
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderObject renderObject) {
    ParallaxRenderObject;
  }
}

class ParallaxParentData extends ContainerBoxParentData {}

class ParallaxRenderObject extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  ScrollableState _scrollable;

  ParallaxRenderObject({required ScrollableState scrollable})
      : _scrollable = scrollable;
  ScrollableState get scrollable => _scrollable;
  set scrollable(ScrollableState value) {
    if (value != _scrollable) {
      if (attached) {
        _scrollable.position.removeListener(markNeedsLayout);
      }
      _scrollable = value;
      if (attached) {
        _scrollable.position.addListener(markNeedsLayout);
      }
    }
  }

  @override
  void attach(PipelineOwner owner) {
    _scrollable.position.addListener(markNeedsLayout);
    super.attach(owner);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData! is ParallaxParentData) {
      child.parentData = ParallaxParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;
    final background = child!;
    final backgroundConstraints = BoxConstraints.tightFor(width: size.width);
    background.layout(backgroundConstraints, parentUsesSize: true);
    (background.parentData as ParallaxParentData).offset = Offset.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // TODO: implement paint
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;

    final listItemOffset =
        localToGlobal(size.centerLeft(Offset.zero), ancestor: scrollableBox);

    final viewportDimession = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimession).clamp(0.0, 1);
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);
    final background = child!;
    final backgroundSize = background.size;
    final listItemSize = size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    context.paintChild(
        background,
        (background.parentData as ParallaxParentData).offset +
            offset +
            Offset(0, childRect.top));
  }
}

class Location {
  final String imageUrl;

  final String name;

  final String place;

  const Location(
      {required this.imageUrl, required this.place, required this.name});
}

const urlPrefix =
    'https://docs.flutter.dev/cookbook/img-files/effects/parallax';
const locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    imageUrl: '$urlPrefix/01-mount-rushmore.jpg',
  ),
  Location(
    name: 'Gardens By The Bay',
    place: 'Singapore',
    imageUrl: '$urlPrefix/02-singapore.jpg',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    imageUrl: '$urlPrefix/03-machu-picchu.jpg',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    imageUrl: '$urlPrefix/04-vitznau.jpg',
  ),
  Location(
    name: 'Bali',
    place: 'Indonesia',
    imageUrl: '$urlPrefix/05-bali.jpg',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    imageUrl: '$urlPrefix/06-mexico-city.jpg',
  ),
  Location(
    name: 'Cairo',
    place: 'Egypt',
    imageUrl: '$urlPrefix/07-cairo.jpg',
  ),
];
