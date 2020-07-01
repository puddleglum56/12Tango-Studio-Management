 import 'package:flutter/material.dart';

import '../types.dart';

Widget eventPillBuilder(Event event) {
    List<Widget> eventPillContent = [];

    Widget levelTick = new Container(
      height: 12,
      width: 4,
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
              fontSize: 10, color: Colors.white, fontWeight: FontWeight.w800)),
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
