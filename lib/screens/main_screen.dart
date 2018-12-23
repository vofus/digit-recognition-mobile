import 'package:digit_recognition/models/recognition_response.dart';
import 'package:digit_recognition/routes.dart';
import 'package:digit_recognition/services/recognition.dart';
import 'package:digit_recognition/services/signature.dart';
import 'package:digit_recognition/widgets/sketchpad.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Sketchpad _sketchpad = new Sketchpad();
  Recognition _recognizer = new Recognition();
  int _recognizedNumber;
  int _recognitionPercent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recognition'),
          actions: <Widget>[_resultsButton()],
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                _sketchpad,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _resultOutput(),
                    _recognitionButton()
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: _clearButton());
  }

  /// Кнопка перехода на экран с результатами
  Widget _resultsButton() {
    return new IconButton(
        icon: const Icon(Icons.list),
        onPressed: () {
          Navigator.pushNamed(context, ROUTE_NAMES[ROUTES.RESULTS]);
        });
  }

  /// Кнопка очистки области для рисования
  Widget _clearButton() {
    return FloatingActionButton(
      child: new Icon(Icons.clear),
      onPressed: () {
        _sketchpad.clear();
        setState(() {
          _recognizedNumber = null;
          _recognitionPercent = 0;
        });
      }
    );
  }

  /// Контейнер для вывода результата распознавания
  Widget _resultOutput() {
    return new Column(
      children: <Widget>[
        new Container(
          width: 56.0,
          height: 56.0,
          margin: EdgeInsets.only(top: 32.0),
          padding: EdgeInsets.only(top: 8.0),
          decoration:
              BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
          child: Text(
            _recognizedNumber != null ? _recognizedNumber.toString() : '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(top: 16.0),
          child: Text(
            '$_recognitionPercent%',
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  /// Кнопка распознавания
  Widget _recognitionButton() {
    return new Container(
      margin: EdgeInsets.only(left: 32.0),
      child: RaisedButton(
        child: Text('Распознать'),
        onPressed: () {
          List<Offset> points = _sketchpad.getPoints();

          if (points.length > 0) {
            _recognizer.recognize(points, Signature.width.truncate())
                .then((RecognitionResponse response) {
                  setState(() {
                    _recognizedNumber = response.result.digit;
                    _recognitionPercent = (response.result.percent * 100).truncate();
                  });
            });
          }
        }
      ),
    );
  }
}
