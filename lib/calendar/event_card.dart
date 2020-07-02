import 'dart:math';

import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

import '../types.dart';
import 'event_pill.dart';

class EventCard extends StatefulWidget {
  Event event;

  EventCard({Key key, this.event}) : super(key: key);

  @override
  EventCardState createState() => EventCardState();
}

class EventCardState extends State<EventCard> {
  bool going = false;
  int spotsTaken = 3;

  @override
  Widget build(BuildContext context) {
    return eventCardBuilder(context, widget.event);
  }

  toggleGoing() {
    setState(() {
      going = !going;
      if (going) {
        spotsTaken += 1;
      } else {
        spotsTaken -= 1;
      }
    });
  }

  Widget eventCardBuilder(context, Event event) {
    List<Widget> levelInfo = [];

    Widget levelTick = new Container(
      height: 30,
      width: 15,
      decoration: BoxDecoration(
        color: getColorForMetalCurrentWeek(event.metal),
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
      child: Text(capitalize(event.dance) + " Group Class",
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

    Widget spotsTakenHeader = Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Text("Spots Taken: " + spotsTaken.toString() + "/5",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w800)),
    );

    Widget goingButton = Padding(
        padding: EdgeInsets.all(10),
        child: FlatButton(
            child: !going
                ? Text("I'm going!", style: TextStyle(color: Colors.white))
                : Icon(Icons.done, color: Colors.white),
            onPressed: toggleGoing,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.white, width: 5))));

    levelInfo.insert(0, levelHeader);

    return new Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            height: 200,
            decoration: BoxDecoration(
                color: getColorForDanceCurrentWeek(event.dance),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                danceAbbreviation,
                goingButton,
              ]),
              Row(children: levelInfo),
              Row(children: [spotsTakenHeader])
            ])));
  }
}
