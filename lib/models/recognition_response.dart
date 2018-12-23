import 'package:digit_recognition/models/recognition_result.dart';

class RecognitionResponse {
  final RecognitionResult result;

  RecognitionResponse({this.result});

  factory RecognitionResponse.fromJson(Map<String, dynamic> json) {
    RecognitionResult _result = RecognitionResult(
      digit: json['result']['digit'],
      percent: json['result']['percent'] * 1.0
    );

    return RecognitionResponse(result: _result);
  }
}