import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  @override
  SkillsState createState() => SkillsState();
}

class SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return skillsBuilder(context);
  }

  Widget skillsBuilder(context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey[100]],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            )
          )
        )
    );
  }
}
