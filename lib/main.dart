import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghcmobile/styles.dart';

import 'home/home_screen.dart';
import 'lending_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   //systemNavigationBarColor: Colors.blue,
    //   statusBarColor: Colors.pink,
    // ));

    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return getErrorWidget(context, errorDetails);
    };

    return MaterialApp(
      title: 'GHC',
      theme: ThemeData(
        primarySwatch: Styles.appColor,

        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }

  Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
    return Center(
      child: Text(
        "Error appeared.",
        style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userId = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  bool lendingpage = false;

   startTime() async {
    var _duration = new Duration(seconds:1);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    if (lendingpage) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => LendingScreen()));
    }
  }
  @override
  void initState() {
    super.initState();
    startTime();
   // read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

 
}
