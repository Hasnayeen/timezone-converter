import 'package:datetime_app/timezone.dart';
import 'package:flutter/material.dart';

class TimeCard extends StatefulWidget {
  final String text;
  final String time;
  final String date;
  final Timezone timezone;
  TimeCard({Key key, this.date, this.time, this.timezone, this.text})
      : super(key: key);

  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            widget.time,
            style: TextStyle(
              fontSize: 40,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.date,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Text(
            widget.timezone.name,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            widget.timezone.offset.toString(),
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
