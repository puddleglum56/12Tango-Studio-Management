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
          child: Text(
        day.day.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),
      )));

  infoContents.insert(0, infoHeader);

  return new Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 90,
          child: Padding(
              padding: EdgeInsets.all(3),
              child: Column(children: infoContents)));
}

Widget eventCardBuilder(Event event) {
    List<Widget> eventPillContent = [];

    Widget levelTick = new Container(
      height: 12,
      width: 6,
      decoration: BoxDecoration(
        color: getColorForMetal(event.metal),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(3), top: Radius.circular(3)),
      ),
    );

    for (var i = 0; i < event.level; i++) {
      eventPillContent.add(levelTick);
    }

    Widget danceAbbreviation = new Padding(
      padding: EdgeInsets.only(left: 3, right: 1),
      child: Text(capitalize(event.dance),
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800)),
    );

    eventPillContent.insert(0, danceAbbreviation);

    return new Padding(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: Container(
            height: 20,
            decoration: BoxDecoration(
                color: getColorForDance(event.dance),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(children: eventPillContent)));
  }
