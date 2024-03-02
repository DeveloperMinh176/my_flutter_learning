import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum _OnTapWinner { none, outer, inner }

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Tapbox(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class Tapbox extends StatefulWidget {
  const Tapbox({
    super.key,
    this.active = false,
    required this.onChanged,
  });

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<Tapbox> createState() => _TapboxState();
}

class _TapboxState extends State<Tapbox> {
  bool _highlight = false;
  bool _lightIsOn = false;
  bool _isYellowTranslucent = false;
  _OnTapWinner _winner = _OnTapWinner.none;
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.lightbulb_outline,
                  size: 60,
                  color: _lightIsOn ? Colors.yellow[600] : Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _lightIsOn = !_lightIsOn;
                }),
                child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.yellow[600],
                    child: Text(
                      _lightIsOn ? "TURN LIGHT OFF" : "TURN LIGHT ON",
                    )),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTap: _handleTap,
          onTapCancel: _handleTapCancel,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
              border: _highlight
                  ? Border.all(
                      color: Colors.teal[700]!,
                      width: 10,
                    )
                  : null,
            ),
            child: Center(
              child: Text(widget.active ? 'Active' : 'Inactive',
                  style: const TextStyle(fontSize: 32, color: Colors.white)),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTapDown: (_) => debugPrint("Green Tapdown"),
            onTapUp: (_) => debugPrint("Green Tapup"),
            onTap: () => {
              setState(() => {_winner = _OnTapWinner.outer})
            },
            onTapCancel: () => debugPrint("Green Cancel"),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                border: _winner == _OnTapWinner.outer
                    ? Border.all(
                        color: Colors.red,
                        width: 5,
                      )
                    : null,
              ),
              child: Center(
                child: GestureDetector(
                  onTapDown: (_) => debugPrint("Yellow Tapdown"),
                  onTapUp: (_) => debugPrint("Yellow Tapup"),
                  onTap: () => {
                    setState(() => {
                          _winner = _OnTapWinner.inner,
                          debugPrint("Yellow Cancel")
                        })
                  },
                  onTapCancel: () => debugPrint("Yellow Cancel"),
                  behavior: _isYellowTranslucent
                      ? HitTestBehavior.translucent
                      : HitTestBehavior.opaque,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        border: _winner == _OnTapWinner.inner
                            ? Border.all(
                                color: Colors.red,
                                width: 5,
                              )
                            : null,
                      ),
                      alignment: Alignment.center,
                      width: 200,
                      height: 200,
                      child: Text(
                        "HitTestBehavior.${_isYellowTranslucent ? "translucent" : "opaque"}",
                      )),
                ),
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => setState(
                          () => _winner = _OnTapWinner.none,
                        ),
                    child: Text("Reset")),
                ElevatedButton(
                  onPressed: () => setState(
                    () => _isYellowTranslucent = !_isYellowTranslucent,
                  ),
                  child: Text(
                      "Set Yellow behavior to. ${_isYellowTranslucent ? "opaque" : "translucent"}"),
                )
              ],
            )),
      ],
    );
  }

  @override
  void dispose() {
    debugPrintGestureArenaDiagnostics = false;
    super.dispose();
  }
}
