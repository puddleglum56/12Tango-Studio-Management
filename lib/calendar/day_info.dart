import 'dart:math';

import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

import '../types.dart';
import 'event_pill.dart';

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
    infoContents.add(eventCardBuilder(event));
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
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.w800),
      ))));

  infoContents.insert(0, infoHeader);

  return new Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 400,
      child: Padding(
          padding: EdgeInsets.all(3), child: ListView(children: infoContents)));
}

Widget eventCardBuilder(Event event) {
  List<Widget> levelInfo = [];

  Widget levelTick = new Container(
    height: 30,
    width: 15,
    decoration: BoxDecoration(
      color: getColorForMetal(event.metal),
      border: Border.all(
        width: 2,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12), top: Radius.circular(12)),
    ),
  );

  for (var i = 0; i < event.level; i++) {
    levelInfo.add(levelTick);
  }

  Widget danceAbbreviation = new Padding(
    padding: EdgeInsets.all(8),
    child: Text(capitalize(event.dance),
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.w800)),
  );

  Widget levelHeader = new Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Text("Level:",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.w800)),
  );

  levelInfo.insert(0, levelHeader);

  return new Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: getColorForDance(event.dance),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              danceAbbreviation,
              Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      child: Text("I'm going!",
                          style: TextStyle(color: Colors.white)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white, width: 5))))
            ]),
            Row(children: levelInfo),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Text(
                    "Spots Taken: " + new Random().nextInt(5).toString() + "/5",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w800)),
              )
            ])
          ])));
}
