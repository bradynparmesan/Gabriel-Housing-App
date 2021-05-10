import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home/home_screen.dart';
import 'main/createaccount_screen.dart';
import 'main/login_screen.dart';
import 'styles.dart';

class LandingScreen extends StatefulWidget {
  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: _onBackPressed,
      child: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(top: 1),
              child: Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/img/landing-bg.png",
                        //  height:200,
                      ),
                      fit: BoxFit.fill,
                      // alignment: Alignment.
                      // scale: 5.0
                    ),
                  ),
                  child: buildLending(context),
                ),
                
              ),
            ),
             Container(
            padding: EdgeInsets.all(65.0),
           // alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/img/landing-logo.png",
            ),
          ),
             
        ],
      ),
    ));
  }

  Widget buildLending(BuildContext context) {
    return ListView(
      children: [
        Container(
         alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              SizedBox(
                height:480
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
