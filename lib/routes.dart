import 'package:digit_recognition/screens/main_screen.dart';
import 'package:digit_recognition/screens/results_screen.dart';
import 'package:flutter/material.dart';

enum ROUTES { MAIN, RESULTS }

const ROUTE_NAMES = <ROUTES, String>{
  ROUTES.MAIN: '/',
  ROUTES.RESULTS: '/results'
};

final routes = <String, WidgetBuilder>{
  ROUTE_NAMES[ROUTES.MAIN]: (BuildContext context) => MainScreen(),
  ROUTE_NAMES[ROUTES.RESULTS]: (BuildContext context) => ResultsScreen()
};
