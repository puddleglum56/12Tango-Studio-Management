import 'dart:math';

import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';

class Event {
  String name;
  String description;
  int level;
  String metal;
  String dance;

  DateTime startDate;
  DateTime endDate;

  Event(this.startDate, this.endDate, this.metal, this.level, this.dance);

  void printProps() {
    print(startDate.toString());
  }
}

class TableExample extends StatefulWidget {
  @override
  _TableExampleState createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  final calendarUtils = new Utils();
  List<Event> events = new List<Event>();

  @override
  void initState() {
    events = makeInitialEvents();
    super.initState();
  }

  DateTime makeDateTime(int year, int month, int day, int hour) {
    return DateTime(year, month, day, hour, 0, 0, 0, 0);
  }

  Event makeRandomEvent(day) {
    List<String> availableDances = [
      "tango",
      "salsa",
      "hustle",
      "waltz",
      "samba",
      "rumba",
      "swing",
    ];

    List<String> availableMetals = ["bronze", "silver", "gold"];

    List<int> availableLevels = [1, 2, 3, 4];

    return new Event(
        day,
        day,
        availableMetals[new Random().nextInt(availableMetals.length)],
        availableLevels[new Random().nextInt(availableLevels.length)],
        availableDances[new Random().nextInt(availableDances.length)]);
  }

  List<Event> makeInitialEvents() {
    return [
      new Event(makeDateTime(2020, 6, 1, 12), makeDateTime(2020, 6, 1, 13),
          'bronze', 1, 'salsa'),
      new Event(makeDateTime(2020, 6, 1, 13), makeDateTime(2020, 6, 1, 14),
          'bronze', 2, 'waltz'),
      new Event(makeDateTime(2020, 6, 3, 17), makeDateTime(2020, 6, 3, 18),
          'bronze', 1, 'tango'),
      new Event(makeDateTime(2020, 6, 4, 19), makeDateTime(2020, 6, 4, 19),
          'bronze', 4, 'swing'),
      new Event(makeDateTime(2020, 6, 9, 12), makeDateTime(2020, 6, 9, 13),
          'silver', 1, 'rumba'),
      new Event(makeDateTime(2020, 6, 12, 12), makeDateTime(2020, 6, 12, 13),
          'bronze', 2, 'hustle'),
      new Event(makeDateTime(2020, 6, 16, 12), makeDateTime(2020, 6, 17, 13),
          'bronze', 3, 'salsa'),
      new Event(makeDateTime(2020, 6, 16, 13), makeDateTime(2020, 6, 16, 14),
          'gold', 1, 'waltz'),
    ];
  }

  List<Event> getEventsForDay(DateTime day) {
    return events.where((event) => eventInDay(event, day)).toList();
  }

  bool eventInDay(Event event, DateTime day) {
    // save this assertion for data validation
    // assert(event.startDate.day == event.endDate.day);
    return event.startDate.day == day.day;
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

  Widget dayCellBuilder(String dayNumber, events) {
    List<Widget> cellContents = [];
    events.forEach((event) {
      cellContents.add(eventPillBuilder(event));
    });

    Widget cellHeader = new FittedBox(
        fit: BoxFit.contain,
        child: Container(
            child: Text(
          dayNumber,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),
        )));

    cellContents.insert(0, cellHeader);

    return new InkWell(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3))),
            height: 90,
            child: Padding(
                padding: EdgeInsets.all(3),
                child: Column(children: cellContents))));
  }

  Color getColorForDance(String dance) {
    Map colorForDance = {
      "tango": Colors.orange,
      "salsa": Colors.red,
      "hustle": Colors.green,
      "waltz": Colors.blue,
      "samba": Colors.amber,
      "rumba": Colors.purple,
      "swing": Colors.pink[300],
    };

    return colorForDance[dance];
  }

  String getDanceAbbreviation(String dance) {
    Map abbreviationForDance = {
      "tango": "Ta",
      "salsa": "Sa",
      "hustle": "Hs",
      "waltz": "Wz",
      "samba": "Sb",
      "rumba": "Rm",
      "swing": "Sw",
    };
    return abbreviationForDance[dance];
  }

  Color getColorForMetal(String metal) {
    Map colorForMetal = {
      "bronze": Colors.brown[500],
      "silver": Colors.grey[400],
      "gold": Colors.amber[400],
    };

    return colorForMetal[metal];
  }

  Widget eventPillBuilder(Event event) {
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
      child: Text(getDanceAbbreviation(event.dance),
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w800)),
    );

    eventPillContent.insert(0, danceAbbreviation);

    return new Padding(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: Container(
            height: 20,
            decoration: BoxDecoration(
                color: getColorForDance(event.dance),
                borderRadius: BorderRadius.all(Radius.circular(3))),
            child: Row(children: eventPillContent)));
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
                  fontSize: 5, fontWeight: FontWeight.bold, color: Colors.grey),
            )));
  }

  Widget dayBuilder(DateTime day) {
    // return dayCellBuilder(day.day.toString(), getEventsForDay(day));
    int numEvents = new Random().nextInt(2) + 1;
    List<Event> randomEvents = [];
    for (int i = 0; i < numEvents; i++) {
      randomEvents.add(makeRandomEvent(day));
    }
    return dayCellBuilder(day.day.toString(), randomEvents);
  }

  TableRow weekdayNameBuilder() {
    List<Widget> weekDays = [];
    Utils.weekdays.forEach((day) {
      weekDays.add(weekdayNameCellBuilder(day[0]));
    });

    return TableRow(children: weekDays);
  }

  TableRow weekBuilder(DateTime dayInWeek) {
    List<Widget> weekDays = [];

    Iterable<DateTime> daysInWeek = Utils.daysInRange(
        Utils.firstDayOfWeek(dayInWeek), Utils.lastDayOfWeek(dayInWeek));

    daysInWeek.forEach(
      (day) {
        weekDays.add(dayBuilder(day));
      },
    );

    return TableRow(children: weekDays);
  }

  DateTime today() {
    return new DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
                children: [
                  Padding(child: Text('July', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)), padding: EdgeInsets.only(bottom: 14)),
                  Table(
                  children: monthBuilder(),
            )])));
  }
}
