import 'package:flutter/foundation.dart';
import 'package:hello_world/state/events/models/event.dart';

class EventState {
  final List<Event> events;

  EventState({this.events});

  EventState copy({List<Event> events}) {
    return EventState(events: events ?? this.events);
  }

  static EventState initialState() => EventState(events: const []);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is EventState &&
            runtimeType == other.runtimeType &&
            listEquals(events, other.events);
  }

  @override
  int get hashCode => events.hashCode;
}
