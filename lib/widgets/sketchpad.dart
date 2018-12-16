import 'package:digit_recognition/services/signature.dart';
import 'package:flutter/material.dart';

class Sketchpad extends StatefulWidget {
  final _state = new _SketchpadState();

  @override
  State createState() => _state;

  clear() {
    _state.clear();
  }
}


class _SketchpadState extends State<Sketchpad> {
  List<Offset> _points = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 280.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.blue)),
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          RenderBox obj = context.findRenderObject();
          Offset _localPosition =
          obj.globalToLocal(details.globalPosition);

          setState(() {
            _points = List.from(_points)..add(_localPosition);
          });
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