import 'package:digit_recognition/services/signature.dart';
import 'package:flutter/material.dart';

class Sketchpad extends StatefulWidget {
  final _state = new _SketchpadState();

  @override
  State createState() => _state;

  clear() {
    _state.clear();
  }

  List<Offset> getPoints() {
    return _state.points;
  }
}


class _SketchpadState extends State<Sketchpad> {
  static const double _WIDTH = 280.0;
  static const double _HEIGHT = 280.0;

  static bool _pointValidate(Offset point) {
    return point.dx >= 0
        && point.dx <= _WIDTH
        && point.dy >= 0
        && point.dy <= _HEIGHT;
  }

  List<Offset> _points = [];

  List<Offset> get points => _points;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _WIDTH,
      height: _HEIGHT,
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.blue)
      ),
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          RenderBox obj = context.findRenderObject();
          Offset _localPosition =
          obj.globalToLocal(details.globalPosition);

          if (_pointValidate(_localPosition)) {
            setState(() {
              _points = List.from(_points)..add(_localPosition);
            });
          }
        },
        onPanEnd: (DragEndDetails details) => _points.add(null),
        child: CustomPaint(
          painter: Signature(points: _points),
          size: Size.infinite,
        ),
      ),
    );
  }


  clear() {
    setState(() {
      _points.clear();
    });
  }
}