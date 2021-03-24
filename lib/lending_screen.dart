import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home/home_screen.dart';
import 'main/createaccount_screen.dart';
import 'main/login_screen.dart';
import 'styles.dart';

class LendingScreen extends StatefulWidget {
  @override
  LendingScreenState createState() => LendingScreenState();
}

class LendingScreenState extends State<LendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: _onBackPressed,
      child: Stack(
        children: [
          Container(
              child: Scaffold(
            body: buildLending(context),
          ))
        ],
      ),
    ));
  }

  Widget buildLending(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 450,
              ),
              Container(
                  child: RaisedButton(
               onPressed: () async {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => LoginScreen(
                                // loginType: "login",
                                )));
                  },
                padding: EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(75.0)),
                child: Ink(
                  decoration: BoxDecoration(
                      color: Styles.buttoncolor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 330.0, minHeight: 52.0),
                    alignment: Alignment.center,
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily:Styles.fontFamilyBold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )),
              SizedBox(
                height:20
              ),
              Container(
                  child: RaisedButton(
                 onPressed: () async {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => CreatAccountScreen(
                                // loginType: "login",
                                )));
                  },
                padding: EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(75.0)),
                child: Ink(
                  decoration: BoxDecoration(
                      color: Styles.buttoncolor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 330.0, minHeight: 52.0),
                    alignment: Alignment.center,
                    child: Text(
                      "CREATE ACCOUNT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily:Styles.fontFamilyBold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
        )
      ],
    );
  }

  Future<bool> _onBackPressed() {
    SystemNavigator.pop(); //  exit(0);
    return Future.value(false);
  }
}
