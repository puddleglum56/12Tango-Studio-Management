import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/state/events/app_state.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

import 'login/login.dart';

Store<AppState> store;

void main() {
  var state = AppState.initialState();
  store = Store<AppState>(initialState: state);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => AsyncReduxProvider<AppState>.value(
      value: store,
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    ),
  );
    
  }
