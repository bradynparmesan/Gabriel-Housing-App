import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ghcmobile/alert_message.dart';
import 'package:ghcmobile/landing_screen.dart';
import 'package:ghcmobile/main/validator.dart';
import 'package:ghcmobile/service/admin_service.dart';
import 'package:ghcmobile/styles.dart';
import 'package:ghcmobile/models/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class AdminScreen extends StatefulWidget {
  @override
  AdminScreenState createState() => AdminScreenState();
}

class AdminScreenState extends State<AdminScreen> {
  final _formKeyuser = GlobalKey<FormState>();
  final textController = TextEditingController();

  bool _autoValidate = false;
  int currentIndex = 0;
  String userText;
  String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
            //change your color here
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 100),
              Container(
                  // padding: const EdgeInsets.all(10),
                  // width: 220,
                  // height: 150,
                  // alignment: Alignment.center,
                  child: Image.asset(
                "assets/img/logo.jpeg",
                fit: BoxFit.contain,
                height: 32,
              ))
            ],
          ),
          actions: [
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 30.0),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: new TextSpan(children: [
                          TextSpan(
                            text: 'LOGOUT',
                            style: TextStyle(
                              fontSize: 18,
                              color: Styles.buttoncolor,
                              fontFamily: Styles.fontFamilyMedium,
                            ),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                removeValues();
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => LandingScreen()));
                              },
                          )
                        ])))
              ],
            )),
          ]),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: <Widget>[messagePage(context)],
        ),
      ),
    );
  }

  Widget messagePage(BuildContext context) {
    return ListView(
      children: [
        Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  child: Form(
                      key: _formKeyuser,
                      autovalidate: _autoValidate,
                      child: Column(
                        children: [
                          Padding(
                            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 26, vertical: 5),
                            child: TextFormField(
                              controller: textController,
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                hintText: 'Text',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontFamily: Styles.fontFamilyMedium,
                                ),
                              ),
                              validator: Validator.validateName,
                              onSaved: (String val) {
                                userText = val;
                                // emailReg = val.trim();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            height: 45,
                            width: 300,
                            child: RaisedButton(
                              child: Text('CREATE MESSAGE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: Styles.fontFamilyBold,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              color: Styles.buttoncolor,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              onPressed: _applyUserData,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ))
      ],
    );
  }

  void _applyUserData() {
    AdminService service = new AdminService();
    if (_formKeyuser.currentState.validate()) {
      _formKeyuser.currentState.save();
      AlertMessage().onLoading(context);

      service.createUserMessage(globals.userId, userText).then((res) {
        if (res.status) {
          Navigator.pop(context);
          AlertMessage().showMessages(res.message);
          userText = "";
          textController.text = "";
        } else {
          Navigator.pop(context);
          AlertMessage().showMessages(res.message);
          print('error  : ${res.message}');
        }
      }).catchError((onError) {
        Navigator.pop(context);
        print(onError);
        // AlertMessage().showMessages(onError.toString());
        Navigator.pop(context);
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("UserId");
    prefs.remove("UserName");
    prefs.remove("Password");

    prefs.remove("Email");
    prefs.remove("Apikey");
    prefs.clear();
    //prefs.commit();
    prefs.remove("LendingScreen");
    globals.userId = 0;
    globals.email = null;
    globals.apiKey = null;
    globals.isLoggedIn = false;
    //read();
  }

  Future<bool> _onBackPressed() {
    return Future.value();
  }
}
