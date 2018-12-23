class RecognitionPoint {
  final double x;
  final double y;

  RecognitionPoint({this.x, this.y});

  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y
    };
  }
}