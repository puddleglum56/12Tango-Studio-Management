import 'dart:math';

import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

import '../types.dart';
import 'event_card.dart';

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
  List<Widget> infoContents = [];
  events.forEach((event) {
    infoContents.add(EventCard(event: event));
  });

  Widget infoHeader = new FittedBox(
      fit: BoxFit.contain,
      child: Container(
          width: 400,
          child: Padding(
              padding: EdgeInsets.only(top: 10, left: 10, bottom: 20),
              child: Text(
                "July " + day.day.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ))));

  infoContents.insert(0, infoHeader);

  return new Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 400,
      child: Padding(
          padding: EdgeInsets.all(3), child: ListView(children: infoContents)));
}

