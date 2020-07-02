import 'package:flutter/material.dart';

import '../types.dart';

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
              color: getColorForDance(event.dance, isCurrentWeek),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          child: Row(children: eventPillContent)));
}

Color getColorForDance(String dance, bool isCurrentWeek) {
  if (isCurrentWeek) {
    return getColorForDanceCurrentWeek(dance);
  } else {
    return getColorForDanceOtherWeek(dance);
  }
}

Color getColorForDanceCurrentWeek(String dance) {
  Map colorForDance = {
    "tango": Colors.orange,
    "salsa": Colors.red,
    "hustle": Colors.green,
    "waltz": Colors.blue,
    "samba": Colors.amber,
    "rumba": Colors.purple,
    "swing": Colors.pink[200],
  };

  return colorForDance[dance];
}

Color getColorForDanceOtherWeek(String dance) {
  Map colorForDance = {
    "tango": Colors.orange[300],
    "salsa": Colors.red[300],
    "hustle": Colors.green[300],
    "waltz": Colors.blue[300],
    "samba": Colors.amber[300],
    "rumba": Colors.purple[300],
    "swing": Colors.pink[100],
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
