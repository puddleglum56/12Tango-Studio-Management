import 'package:hello_world/state/events/models/calendar_events_state.dart';

class AppState {
  final CalendarEventsState calendarEventsState;

  AppState({this.calendarEventsState});

  AppState copy({
    CalendarEventsState calendarEventsState,
  }) => AppState(calendarEventsState: calendarEventsState ?? this.calendarEventsState);

  static AppState initialState() => AppState(
        calendarEventsState: CalendarEventsState.initialState(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          calendarEventsState == other.calendarEventsState;

  @override
  int get hashCode =>
      calendarEventsState.hashCode; //^ userState.hashCode ^ todoState.hashCode;
}
