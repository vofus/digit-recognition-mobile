import 'package:flutter/material.dart';

class Signature extends CustomPainter {
  static final double width = 20.0;
  static final Paint _paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = width;

  List<Offset> points;

  Signature({this.points});

  @override
  bool shouldRepaint(Signature oldDelegate) {
    return oldDelegate.points.length != points.length;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], _paint);
      }
    }
  }
}
