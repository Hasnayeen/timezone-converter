import 'package:datetime_app/timezone.dart';
import 'package:flutter/material.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  List<Timezone> locations = [];
  Map data = {};

  void updateTimezone(index) {
    Timezone instance = locations[index];
    List<String> offset = instance.offset.toString().split(".");
    DateTime now = DateTime.now();
    DateTime to = now.toUtc().add(
        Duration(hours: int.parse(offset[0]), minutes: int.parse(offset[1])));
    Navigator.pop(context, {
      'from': now,
      'fromTz': data['fromTz'],
      'to': to,
      'toTz': instance,
      'timezones': locations,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    locations = data['timezones'];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("DateTime"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
          child: Card(
            child: ListTile(
              onTap: () {
                updateTimezone(index);
              },
              title: Text(
                "${locations[index].code} : ${locations[index].name}",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  text: "Offset: ",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "${locations[index].offset}",
                      style: TextStyle(
                        color: Colors.teal[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
//              subtitle: Text(
//                "${locations[index].offset}",
//                style: TextStyle(
//                  fontSize: 16.0,
//                  fontWeight: FontWeight.bold,
//                  color: Colors.teal[700],
//                ),
//              ),
            ),
          ),
        );
      }),
    );
  }
}
