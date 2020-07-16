class CalendarEvent {
  String name;
  String description;
  int level;
  String metal;
  String dance;
  int maxAttendees;
  int attendees;

  DateTime startDate;
  DateTime endDate;

  CalendarEvent(day, hour, this.metal, this.level, this.dance) {
    var now = DateTime.now();
    this.startDate = new DateTime(now.year, now.month, day, hour, 0, 0, 0, 0);
    this.endDate = startDate.add(Duration(minutes: 45));
  }

  void printProps() {
    print(startDate.toString());
  }
}
