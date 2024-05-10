import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsSimulation extends StatelessWidget {
  final String title;

  const PhysicsSimulation({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: DrapableCard(child: FlutterLogo(size: 128)));
  }
}

class DrapableCard extends StatefulWidget {
  final Widget child;

  const DrapableCard({super.key, required this.child});
  @override
  State<DrapableCard> createState() => _DrapableCardState();
}

class _DrapableCardState extends State<DrapableCard>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this);
  late Animation _animation;
  Alignment _dragAlignment = Alignment(0, 0);

  _runAnimation(Offset pixelsPerSecond, Size size) {
    final unitsPerSecondx = pixelsPerSecond.dx / size.width;
    final unitsPerSecondy = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondx, unitsPerSecondy);
    final unitVelocity = unitsPerSecond.distance;

    _animation = _controller
        .drive(AlignmentTween(begin: _dragAlignment, end: Alignment(0, 0)));
    final spring = SpringDescription(mass: 30, stiffness: 1, damping: 1);

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    _controller
        .addListener(() => setState(() => _dragAlignment = _animation.value));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onPanDown: (details) => _controller.stop(),
      onPanUpdate: (details) => setState(() => _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          )),
      onPanEnd: (details) =>
          _runAnimation(details.velocity.pixelsPerSecond, size),
      child: Align(alignment: _dragAlignment, child: Card(child: widget.child)),
    );
  }
}
