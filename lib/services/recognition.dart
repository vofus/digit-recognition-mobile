import 'dart:async';
import 'dart:convert';

import 'package:digit_recognition/models/recognition_point.dart';
import 'package:digit_recognition/models/recognition_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Recognition {
  static const String URL =
      'http://digit-recognition.vofus.ru/recognizer/api/recognition/from_path';
  static const Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  static List<RecognitionPoint> _preparePoints(List<Offset> points) {
    return points
        .where((Offset point) => point != null)
        .map((Offset point) => new RecognitionPoint(x: point.dx, y: point.dy))
        .toList();
  }

  Future<RecognitionResponse> recognize(List<Offset> points, int width) async {
    final path = _preparePoints(points);
    final body = jsonEncode({'path': path, 'width': width});
    final response = await http.post(URL, headers: headers, body: body);

    if (response.statusCode == 200) {
      return RecognitionResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
