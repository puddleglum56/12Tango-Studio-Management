
import 'package:flutter/material.dart';
import 'package:hello_world/state/events/app_state.dart';
import 'package:hello_world/state/events/models/calendar_events_state.dart';
import 'package:intl/intl.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

import 'event_card.dart';

class DayInfo extends StatefulWidget {
  DateTime day;

  DayInfo({Key key, this.day }) : super(key: key);

  @override
  DayInfoState createState() => DayInfoState();
}

class DayInfoState extends State<DayInfo> {
  @override
  Widget build(BuildContext context) {
    return ReduxSelector<AppState, dynamic>(
        selector: (context, state) => [state.calendarEventsState.events],
        builder: (context, store, state, dispatch, model, child) =>
            dayInfoBuilder(
                context, state.calendarEventsState, widget.day));
  }

  Widget dayInfoBuilder(context, CalendarEventsState calendarEventsState, DateTime day) {
  List<Widget> infoContents = [];
  calendarEventsState.selectEventsForDay(day).forEach((event) {
    infoContents.add(EventCard(event: event));
  });

  Widget infoHeader = new FittedBox(
      fit: BoxFit.contain,
      child: Container(
          width: 400,
          child: Padding(
              padding: EdgeInsets.only(top: 10, left: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    new DateFormat.MMMM().format(day) + " " + day.day.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  // scheduleLessonButton,
              ]))));

  infoContents.insert(0, infoHeader);

  return new Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 400,
      child: Padding(
          padding: EdgeInsets.all(3), child: ListView(children: infoContents)));
}

    final Widget scheduleLessonButton = Padding(
        padding: EdgeInsets.all(10),
        child: FlatButton(
            child: Text("Schedule a lesson!", style: TextStyle(color: Colors.white)),
            onPressed: () {},
            color: Colors.red[600],
            disabledColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                )));


}
