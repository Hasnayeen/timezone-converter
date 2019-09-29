import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_app/time_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("DateTime"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: <Widget>[
          TimeCard(
            text: "From:",
            date: new DateFormat("yMMMd", "en_US").format(data['from']),
            time: new DateFormat("jm", "en_US").format(data['from']),
            timezone: data['fromTz'],
          ),
          SizedBox(
            height: 60,
          ),
          TimeCard(
            text: "To:",
            date: new DateFormat("yMMMd", "en_US").format(data['to']),
            time: new DateFormat("jm", "en_US").format(data['to']),
            timezone: data['toTz'],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic result =
              await Navigator.pushNamed(context, '/timezones', arguments: {
            'from': data['from'],
            'fromTz': data['fromTz'],
            'timezones': data['timezones'],
          });
          if (result != null) {
            setState(() {
              data = {
                'from': result['from'],
                'fromTz': result['fromTz'],
                'to': result['to'],
                'toTz': result['toTz'],
                'timezones': result['timezones'],
              };
            });
          }
        },
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          Icons.edit_location,
        ),
      ),
    );
  }
}
