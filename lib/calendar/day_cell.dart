import 'package:flutter/material.dart';

import '../types.dart';
import 'day_info.dart';
import 'event_pill.dart';

class DayCell extends StatefulWidget {
  DateTime day;
  List<Event> events;

  DayCell({Key key, this.day, this.events}) : super(key: key);

  @override
  DayCellState createState() => DayCellState();
}

class DayCellState extends State<DayCell> {
  @override
  Widget build(BuildContext context) {
    return dayCellBuilder(context, widget.day, widget.events);
  }
}

Widget dayCellBuilder(context, DateTime day, events) {
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
      onTap: () {
        showBottomSheet(
            context: context,
            builder: (context) => Container(child: DayInfo(day: day, events: events)));
      },
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
  return (day.day == now.day && day.month == now.month && day.year == now.year);
}

Border todayStyle(DateTime day) {
  if (isToday(day)) {
    return Border.all(color: Colors.blue);
  } else {
    return Border.all(color: Colors.transparent);
  }
}
