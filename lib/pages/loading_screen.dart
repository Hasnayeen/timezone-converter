import 'package:datetime_app/timezone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/timezones.json');
  }

  void setupDefaultTimezone() async {
    String loadedData = await loadAsset();
    List<Timezone> timezones = parseJson(loadedData);

    Timezone fromTz = Timezone(
      name: 'Bangladesh Standard Time',
      code: 'BST',
      offset: 6,
      text: '(UTC+06:00) Dhaka',
    );

    DateTime now = DateTime.now();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'from': now,
      'fromTz': fromTz,
      'to': now,
      'toTz': fromTz,
      'timezones': timezones,
    });
  }

  List<Timezone> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Timezone>((json) => new Timezone.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    setupDefaultTimezone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
