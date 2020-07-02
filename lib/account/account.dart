
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return accountBuilder(context);
  }

  Widget accountBuilder(context) {
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
