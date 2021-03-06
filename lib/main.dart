import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghcmobile/admin/user_admin.dart';
import 'package:ghcmobile/styles.dart';

import 'home/home_screen.dart';
import 'landing_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String ghcMember = "";
  String ghcTenant = "";
  int role;
  bool lendingpage = false;

  startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (lendingpage) {
      if (role == 2) {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => AdminScreen()));
      } else {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => HomePage()));
      }
    } else {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => LandingScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
    read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      lendingpage = prefs.containsKey('lendingpage') ? true : false;
      userId = prefs.getString('UserId').toString();
      print("====userId====" + userId.toString());
      email = prefs.getString('UserName');
      print("====email====" + email.toString());
      password = prefs.getString('Password');
      print("====password====" + password.toString());
      firstName = prefs.getString('FirstName');
      print("====firstName====" + firstName.toString());
      lastName = prefs.getString('LastName');
      print("====lastName====" + lastName.toString());
      ghcMember = prefs.getString('GhcMember');
      print("====ghcMember====" + ghcMember.toString());
      ghcTenant = prefs.getString('GhcTenant');
      print("====ghcTenant====" + ghcTenant.toString());
      // role = prefs.getString('Role');
      // print("====role====" + role.toString());
    });
  }
}
