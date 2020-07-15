import 'dart:math';

import 'package:hello_world/state/events/models/calendar_event.dart';

DateTime makeDateTime(int year, int month, int day, int hour) {
    return DateTime(year, month, day, hour, 0, 0, 0, 0);
  }

CalendarEvent makeRandomEvent(day) {
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

    return new CalendarEvent(
        day,
        day.add(new Duration(hours: 1)),
        availableMetals[new Random().nextInt(availableMetals.length)],
        availableLevels[new Random().nextInt(availableLevels.length)],
        availableDances[new Random().nextInt(availableDances.length)]);
}

bool eventInDay(CalendarEvent event, DateTime day) {
    // save this assertion for data validation
    // assert(event.startDate.day == event.endDate.day);
    return (event.startDate.day == day.day && event.startDate.month == day.month && event.startDate.year == day.year);
}
