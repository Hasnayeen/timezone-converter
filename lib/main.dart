import 'package:datetime_app/pages/select_location.dart';
import 'package:flutter/material.dart';
import 'package:datetime_app/pages/home.dart';
import 'package:datetime_app/pages/loading_screen.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => Home(),
        '/timezones': (context) => SelectLocation(),
      },
    ));
