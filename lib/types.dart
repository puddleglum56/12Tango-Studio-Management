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
