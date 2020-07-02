import 'package:flutter/material.dart';
import 'package:hello_world/main/navigation_bars.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  Alignment childAlignment = Alignment.center;
  bool keyboardDown = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          keyboardDown = !visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      style: style,
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box),
        contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        hintText: "Email",
        filled: true,
        fillColor: Colors.white,
        border:
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.00),
            borderSide: BorderSide.none,
            )),

    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        hintText: "Password",
        filled: true,
        fillColor: Colors.white,
        border:
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.00),
            borderSide: BorderSide.none,
            )),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.red,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyStatefulWidget())
          );
        },
        child: Text("Login", 
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.red, Colors.red[900]], begin: Alignment.bottomLeft, end: Alignment.topRight)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child:
            AnimatedContainer(
            curve: Curves.easeOut,
            duration: Duration(
              milliseconds: 400,
            ),
            padding: const EdgeInsets.all(20),
              child: Stack(
                children: <Widget> [
                  Container(
                    child: new Image.asset(
                      "assets/logo.png",
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      elevation: 5.0,
                      color: Color(0xfa83232f),
                      borderRadius: BorderRadius.circular(20.0),
                      child:
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(height: 50.0),
                              emailField,
                              SizedBox(height: 25.0),
                              passwordField,
                              SizedBox(height: 35.0),
                              loginButton,
                              SizedBox(height: 40),
                          ],
                        ),
                        ),
                    ),
                  ),
                ],
              ),
          ),
        ),
        ),
      ),
    );
  }
}
