import 'package:flutter/material.dart';

class Signature extends CustomPainter {
  static final Paint _paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 20.0;

  List<Offset> points;

  Signature({this.points});

  @override
  bool shouldRepaint(Signature oldDelegate) {
    print('shouldRepaint: ${oldDelegate.points != points}');
    print('shouldRepaint OLD: ${oldDelegate.points.length}');
    print('shouldRepaint NEW: ${points.length}');

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
