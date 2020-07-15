import 'dart:math';

import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/calendar/util.dart';
import 'package:hello_world/state/events/models/calendar_event.dart';
import 'package:intl/intl.dart';

import 'day_cell/day_cell.dart';

class Calendar extends StatefulWidget {
  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  final calendarUtils = new Utils();
  List<CalendarEvent> events = new List<CalendarEvent>();

  @override
  void initState() {
    events = makeInitialEvents();
    super.initState();
  }

  List<CalendarEvent> makeInitialEvents() {
    return [
      CalendarEvent(makeDateTime(2020, 6, 1, 12), makeDateTime(2020, 6, 1, 13),
          'bronze', 1, 'salsa'),
      CalendarEvent(makeDateTime(2020, 6, 1, 13), makeDateTime(2020, 6, 1, 14),
          'bronze', 2, 'waltz'),
      CalendarEvent(makeDateTime(2020, 6, 3, 17), makeDateTime(2020, 6, 3, 18),
          'bronze', 1, 'tango'),
      CalendarEvent(makeDateTime(2020, 6, 4, 19), makeDateTime(2020, 6, 4, 19),
          'bronze', 4, 'swing'),
      CalendarEvent(makeDateTime(2020, 6, 9, 12), makeDateTime(2020, 6, 9, 13),
          'silver', 1, 'rumba'),
      CalendarEvent(makeDateTime(2020, 6, 12, 12),
          makeDateTime(2020, 6, 12, 13), 'bronze', 2, 'hustle'),
      CalendarEvent(makeDateTime(2020, 6, 16, 12),
          makeDateTime(2020, 6, 17, 13), 'bronze', 3, 'salsa'),
      CalendarEvent(makeDateTime(2020, 6, 16, 13),
          makeDateTime(2020, 6, 16, 14), 'gold', 1, 'waltz'),
    ];
  }

  List<CalendarEvent> getEventsForDay(DateTime day) {
    return events.where((event) => eventInDay(event, day)).toList();
  }

  List<TableRow> monthBuilder() {
    List<TableRow> weeksInMonth = [];

    weeksInMonth.add(weekdayNameBuilder());

    Utils.daysInMonth(today()).forEach((day) {
      if (day.weekday == DateTime.saturday) {
        weeksInMonth.add(weekBuilder(day));
      }
    });
    // weeksInMonth.add(weekBuilder(Utils.lastDayOfMonth(today())));

    return weeksInMonth;
  }

  Widget weekdayNameCellBuilder(String title) {
    return new FittedBox(
        fit: BoxFit.contain,
        child: Container(
            height: 6.0,
            width: 20.0,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 5,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            )));
  }

  Widget dayBuilder(DateTime day, bool isCurrentWeek) {
    // return dayCellBuilder(day.day.toString(), getEventsForDay(day));
    int numEvents = new Random().nextInt(3) + 1;
    List<CalendarEvent> randomEvents = [];
    for (int i = 0; i < numEvents; i++) {
      randomEvents.add(makeRandomEvent(day));
    }
    return DayCell(
        day: day, events: randomEvents, isCurrentWeek: isCurrentWeek);
  }

  TableRow weekdayNameBuilder() {
    List<Widget> weekDays = [];
    Utils.weekdays.forEach((day) {
      weekDays.add(weekdayNameCellBuilder(day[0]));
    });

    return TableRow(children: weekDays);
  }

  TableRow weekBuilder(DateTime dayInWeek) {
    bool isCurrentWeek = false;

    List<Widget> weekDays = [];

    Iterable<DateTime> daysInWeek = Utils.daysInRange(
        Utils.firstDayOfWeek(dayInWeek), Utils.lastDayOfWeek(dayInWeek));

    daysInWeek.forEach(
      (day) {
        if (day.day == today().day &&
            day.month == today().month &&
            day.year == today().year) {
          isCurrentWeek = true;
        }
      },
    );

    daysInWeek.forEach(
      (day) {
        weekDays.add(dayBuilder(day, isCurrentWeek));
      },
    );

    return TableRow(children: weekDays);
  }

  DateTime today() {
    return new DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return calendarBuilder();
  }

  Widget calendarBuilder() {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.white, Colors.grey[100]],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            )),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(children: [
                  Padding(
                      child: Text(new DateFormat.MMMM().format(today()),
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20)),
                      padding: EdgeInsets.only(bottom: 10)),
                  Table(
                    children: monthBuilder(),
                  )
                ]))));
  }
}
