import 'package:digit_recognition/routes.dart';
import 'package:digit_recognition/widgets/sketchpad.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Sketchpad _sketchpad = new Sketchpad();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main screen'),
          actions: <Widget>[_resultsButton()],
        ),
        body: Center(
          child: Column(
            children: <Widget>[_sketchpad],
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
      onPressed: () => _sketchpad.clear(),
    );
  }
}
