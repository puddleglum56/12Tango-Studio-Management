import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return feedBuilder(context);
  }

  Widget feedBuilder(context) {
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
