import 'package:flutter/material.dart';
import 'package:hello_world/state/events/models/event.dart';


Widget eventPillBuilder(Event event, bool isCurrentWeek) {
  List<Widget> eventPillContent = [];

  Widget levelTick = new Container(
    height: 12,
    width: 5,
    decoration: BoxDecoration(
      color: getColorForMetal(event.metal, isCurrentWeek),
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
            fontSize: 10, color: Colors.white, fontWeight: FontWeight.w800)),
  );

  eventPillContent.insert(0, danceAbbreviation);

  return new Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Container(
          height: 20,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: getColorForDance(event.dance, isCurrentWeek)),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          child: Row(children: eventPillContent)));
}

List<Color> getColorForDance(String dance, bool isCurrentWeek) {
  if (isCurrentWeek) {
    return getColorForDanceCurrentWeek(dance);
  } else {
    return getColorForDanceOtherWeek(dance);
  }
}

List<Color> getColorForDanceCurrentWeek(String dance) {
  Map colorForDance = {
    "tango": [Colors.orange[600], Colors.orange[700]],
    "salsa": [Colors.red[600],Colors.red[700]],
    "hustle": [Colors.green[600],Colors.green[700]],
    "waltz": [Colors.blue[600],Colors.blue[700]],
    "samba": [Colors.amber[600],Colors.amber[700]],
    "rumba": [Colors.purple[600],Colors.purple[700]],
    "swing": [Colors.pink[300],Colors.pink[400]],
  };

  return colorForDance[dance];
}

List<Color> getColorForDanceOtherWeek(String dance) {
  Map colorForDance = {
    "tango": [Colors.orange[300], Colors.orange[300]],
    "salsa": [Colors.red[300],Colors.red[300]],
    "hustle": [Colors.green[300],Colors.green[300]],
    "waltz": [Colors.blue[300],Colors.blue[300]],
    "samba": [Colors.amber[300],Colors.amber[300]],
    "rumba": [Colors.purple[300],Colors.purple[300]],
    "swing": [Colors.pink[200],Colors.pink[200]],
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

Color getColorForMetal(String metal, bool isCurrentWeek) {
  if (isCurrentWeek) {
    return getColorForMetalCurrentWeek(metal);
  } else {
    return getColorForMetalOtherWeek(metal);
  }
}

Color getColorForMetalCurrentWeek(String metal) {
  Map colorForMetal = {
    "bronze": Colors.brown[500],
    "silver": Colors.grey[400],
    "gold": Colors.amber[400],
  };

  return colorForMetal[metal];
}

Color getColorForMetalOtherWeek(String metal) {
  Map colorForMetal = {
    "bronze": Colors.brown[400],
    "silver": Colors.grey[300],
    "gold": Colors.amber[300],
  };

  return colorForMetal[metal];
}
