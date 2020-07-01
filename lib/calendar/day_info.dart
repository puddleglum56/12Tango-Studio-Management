import 'package:flutter/material.dart';

import '../types.dart';

class DayInfo extends StatefulWidget {
  DateTime day;
  List<Event> events;

  DayInfo({Key key, this.day, this.events}) : super(key: key);

  @override
  DayInfoState createState() => DayInfoState();
}

class DayInfoState extends State<DayInfo> {
  @override
  Widget build(BuildContext context) {
    return dayInfoBuilder(context, widget.day, widget.events);
  }
}

Widget dayInfoBuilder(context, day, events) {
  events.forEach((event) {

  });

  return Column(
    children: <Widget>[Text('hey')],
  );
}
