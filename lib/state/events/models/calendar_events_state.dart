import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:hello_world/calendar/util.dart';
import 'package:hello_world/state/events/models/calendar_event.dart';

class CalendarEventsState {
  final List<CalendarEvent> events;

  CalendarEventsState({this.events});

  CalendarEventsState copy({List<CalendarEvent> events}) {
    return CalendarEventsState(events: events ?? this.events);
  }

  static CalendarEventsState initialState() => CalendarEventsState(events: [
      CalendarEvent(makeDateTime(2020, 7, 1, 12), makeDateTime(2020, 7, 1, 13),
          'bronze', 1, 'salsa'),
      CalendarEvent(makeDateTime(2020, 7, 1, 13), makeDateTime(2020, 7, 1, 14),
          'bronze', 2, 'waltz'),
      CalendarEvent(makeDateTime(2020, 7, 3, 17), makeDateTime(2020, 7, 3, 18),
          'bronze', 1, 'tango'),
      CalendarEvent(makeDateTime(2020, 7, 4, 19), makeDateTime(2020, 7, 4, 19),
          'bronze', 4, 'swing'),
      CalendarEvent(makeDateTime(2020, 7, 9, 12), makeDateTime(2020, 7, 9, 13),
          'silver', 1, 'rumba'),
      CalendarEvent(makeDateTime(2020, 7, 12, 12), makeDateTime(2020, 7, 12, 13),
          'bronze', 2, 'hustle'),
      CalendarEvent(makeDateTime(2020, 7, 16, 12), makeDateTime(2020, 7, 17, 13),
          'bronze', 3, 'salsa'),
      CalendarEvent(makeDateTime(2020, 7, 16, 13), makeDateTime(2020, 7, 16, 14),
          'gold', 1, 'waltz'),
    ]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CalendarEventsState &&
            runtimeType == other.runtimeType &&
            listEquals(events, other.events);
  }

  @override
  int get hashCode => events.hashCode;

  static List<CalendarEvent> selectEventsForDay(CalendarEventsState state, {DateTime day}) 
    => _selectEventsForDay(state.events)(day);

  static final _selectEventsForDay = cache1_1(
    (List<CalendarEvent> events)
    => (DateTime day)
    => events.where((event) => eventInDay(event, day)).toList()
  );
}
