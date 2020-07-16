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
      CalendarEvent(1, 14, 'beginner', 1, 'swing'),
      CalendarEvent(1, 14, 'bronze', 2, 'bachata'),
      CalendarEvent(1, 14, 'bronze', 3, 'bachata'),
      CalendarEvent(2, 14, 'beginner', 1, 'waltz'),
      CalendarEvent(2, 14, 'beginner', 2, 'swing'),
      CalendarEvent(6, 14, 'beginner', 1, 'salsa'),
      CalendarEvent(6, 14, 'bronze', 1, 'swing'),
      CalendarEvent(7, 14, 'beginner', 1, 'swing'),
      CalendarEvent(7, 14, 'bronze', 2, 'chacha'),
      CalendarEvent(7, 14, 'bronze', 4, 'rumba'),
      CalendarEvent(8, 14, 'beginner', 1, 'waltz'),
      CalendarEvent(8, 14, 'bronze', 2, 'waltz'),
      CalendarEvent(8, 14, 'bronze', 3, 'bolero'),
      CalendarEvent(9, 14, 'beginner', 1, 'chacha'),
      CalendarEvent(9, 14, 'beginner', 2, 'swing'),
      CalendarEvent(10, 14, 'beginner', 1, 'tango'),
      CalendarEvent(10, 14, 'bronze', 1, 'salsa'),
      CalendarEvent(10, 14, 'beginner', 2, 'swing'),
      CalendarEvent(13, 14, 'beginner', 1, 'swing'),
      CalendarEvent(13, 14, 'bronze', 1, 'waltz'),
      CalendarEvent(14, 14, 'beginner', 1, 'waltz'),
      CalendarEvent(14, 14, 'bronze', 2, 'salsa'),
      CalendarEvent(14, 14, 'bronze', 4, 'waltz'),
      CalendarEvent(15, 14, 'beginner', 1, 'chacha'),
      CalendarEvent(15, 14, 'bronze', 2, 'rumba'),
      CalendarEvent(15, 14, 'bronze', 3, 'swing'),
      CalendarEvent(16, 14, 'beginner', 1, 'tango'),
      CalendarEvent(16, 14, 'beginner', 2, 'swing'),
      CalendarEvent(17, 14, 'beginner', 1, 'bachata'),
      CalendarEvent(17, 14, 'bronze', 1, 'chacha'),
      CalendarEvent(17, 14, 'beginner', 2, 'swing'),
      CalendarEvent(20, 14, 'beginner', 1, 'rumba'),
      CalendarEvent(20, 14, 'bronze', 1, 'bachata'),
      CalendarEvent(21, 14, 'beginner', 1, 'chacha'),
      CalendarEvent(21, 14, 'bronze', 2, 'foxtrot'),
      CalendarEvent(21, 14, 'bronze', 4, 'hustle'),
      CalendarEvent(22, 14, 'beginner', 1, 'foxtrot'),
      CalendarEvent(22, 14, 'bronze', 2, 'hustle'),
      CalendarEvent(22, 14, 'bronze', 2, 'rumba'),
      CalendarEvent(23, 14, 'beginner', 1, 'salsa'),
      CalendarEvent(23, 14, 'beginner', 2, 'swing'),
      CalendarEvent(24, 14, 'beginner', 1, 'swing'),
      CalendarEvent(24, 14, 'bronze', 1, 'tango'),
      CalendarEvent(24, 14, 'beginner', 2, 'swing'),
      CalendarEvent(27, 14, 'beginner', 1, 'chacha'),
      CalendarEvent(27, 14, 'bronze', 1, 'rumba'),
      CalendarEvent(28, 14, 'beginner', 1, 'foxtrot'),
      CalendarEvent(28, 14, 'bronze', 2, 'swing'),
      CalendarEvent(28, 14, 'bronze', 4, 'waltz'),
      CalendarEvent(29, 14, 'beginner', 1, 'bachata'),
      CalendarEvent(29, 14, 'bronze', 2, 'tango'),
      CalendarEvent(29, 14, 'bronze', 3, 'foxtrot'),
      CalendarEvent(30, 14, 'beginner', 1, 'swing'),
      CalendarEvent(30, 14, 'beginner', 2, 'swing'),
      CalendarEvent(31, 14, 'beginner', 1, 'rumba'),
      CalendarEvent(31, 14, 'bronze', 1, 'hustle'),
      CalendarEvent(31, 14, 'beginner', 2, 'swing'),
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

  List<CalendarEvent> selectEventsForDay(DateTime day)
    => _selectEventsForDay(this.events)(day);

  static final _selectEventsForDay = cache1_1(
    (List<CalendarEvent> events)
    => (DateTime day)
    => events.where((event) => eventInDay(event, day)).toList()
  );
}
