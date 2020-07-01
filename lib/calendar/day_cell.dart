import 'package:flutter/material.dart';

import 'event_pill.dart';

Widget dayCellBuilder(DateTime day, events) {
    List<Widget> cellContents = [];
    events.forEach((event) {
      cellContents.add(eventPillBuilder(event));
    });

    Widget cellHeader = new FittedBox(
        fit: BoxFit.contain,
        child: Container(
            child: Text(
          day.day.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),
        )));

    cellContents.insert(0, cellHeader);

    return new InkWell(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                border: todayStyle(day),
                borderRadius: BorderRadius.all(Radius.circular(3))),
            height: 90,
            child: Padding(
                padding: EdgeInsets.all(3),
                child: Column(children: cellContents))));
  }

  bool isToday(day) {
    DateTime now = DateTime.now();
    return (day.day == now.day &&
        day.month == now.month &&
        day.year == now.year);
  }

  Border todayStyle(DateTime day) {
    if (isToday(day)) {
      return Border.all(color: Colors.blue);
    } else {
      return Border.all(color: Colors.transparent);
    }
  }

