import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ghcmobile/alert_message.dart';
import 'package:ghcmobile/home/home_screen.dart';
import 'package:ghcmobile/main/validator.dart';
import 'package:ghcmobile/service/account_service.dart';
import 'package:ghcmobile/models/globals.dart' as globals;

import 'package:shared_preferences/shared_preferences.dart';

import '../styles.dart';
import 'createaccount_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKeyLogin = GlobalKey<FormState>();

  String choice;
  bool _autoValidate = false;
  String email;
  String _radioValue;
  String _memberValue;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Form(
                key: _formKeyLogin,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Center(
                          // child: Container(
                          // width: 200,
                          // height: 150,
                          // /*decoration: BoxDecoration(
                          //     color: Colors.red,
                          //     borderRadius: BorderRadius.circular(50.0)),*/
                          // child: Image.asset('asset/images/flutter-logo.png')),
                          ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text(
                          'USERNAME',
                          style: Styles.headerText,
                        )),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Username',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.person_outline_outlined),
                            color: Colors.grey[400],
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontFamily: Styles.fontFamilyMedium,
                          ),
                        ),
                        validator: Validator.validateEmail,
                        onSaved: (String val) {
                          //  email = val;
                          email = val.trim();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text(
                          'PASSWORD',
                          style: Styles.headerText,
                        )),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.vpn_key_outlined),
                            color: Colors.grey[400],
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontFamily: Styles.fontFamilyMedium,
                          ),
                        ),
                        validator: Validator.validPassword,
                        onSaved: (String val) {
                          password = val;
                          // emailReg = val.trim();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text('ARE YOU A GHC MEMBER',
                            style: Styles.headerText)),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: new Theme(
                          data: new ThemeData(
                            primarySwatch: Styles.appColor,
                            // unselectedWidgetColor: Styles.appColor,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                  scale: 1.1,
                                  child: Radio(
                                    value: 'one',
                                    groupValue: _radioValue,
                                    onChanged: radioButtonChanges,
                                  )),
                              Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 17,
                                    fontFamily: Styles.fontFamilyMedium),
                              ),
                              Transform.scale(
                                  scale: 1.1,
                                  child: Radio(
                                    value: 'two',
                                    groupValue: _radioValue,
                                    onChanged: radioButtonChanges,
                                  )),
                              Text(
                                "No",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 17,
                                    fontFamily: Styles.fontFamilyMedium),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: 10),
                    Container(
                                              width: MediaQuery.of(context).size.width / 1.20,

                        child: Text('ARE YOU A GHC MEMBER',
                            style: Styles.headerText)),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: new Theme(
                          data: new ThemeData(
                            primarySwatch: Styles.appColor,
                            // unselectedWidgetColor: Styles.appColor,
                          ),
                          child: Row(
                           // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                  scale: 1.1,
                                  child: Radio(
                                    value: 'one',
                                    groupValue: _memberValue,
                                    onChanged: radioMemberChanges,
                                  )),
                              Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 17,
                                    fontFamily: Styles.fontFamilyMedium),
                              ),
                              Transform.scale(
                                  scale: 1.1,
                                  child: Radio(
                                    value: 'two',
                                    groupValue: _memberValue,
                                    onChanged: radioMemberChanges,
                                  )),
                              Text(
                                "No",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 17,
                                    fontFamily: Styles.fontFamilyMedium),
                              ),
                            ],
                          ),
                        )),
                    
                    SizedBox(height: 10),
                  ],
                )),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomBarButton(),
    );
  }

  Widget buildBottomBarButton() {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                height: 45,
                width: 300,
                child: RaisedButton(
                  child: Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: Styles.fontFamilyBold,
                      fontSize: 18,
                    ),
                  ),
                  color: Styles.buttoncolor,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  onPressed: _validateInputLogin,
                ),
              )
            ]));
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          value = "Yes";
          break;
        case 'two':
          value = "No";
          break;

        default:
          choice = null;
      }
      // debugPrint(genderReg); //Debug the choice in console
    });
  }

  void radioMemberChanges(String value) {
    setState(() {
      _memberValue = value;
      switch (value) {
        case 'one':
          value = "Yes";
          break;
        case 'two':
          value = "No";
          break;

        default:
          choice = null;
      }
      // debugPrint(genderReg); //Debug the choice in console
    });
  }

  saveData(dynamic data) async {
    final prefs = await SharedPreferences.getInstance();
    print("read=========" + data["userId"].toString());
    prefs.setString("UserId", data["userId"].toString());
    prefs.setString("UserName", data["email"]);
    prefs.setString("FirstName", data["firstName"]);
    prefs.setString("LastName", data["lastName"]);
    prefs.setString("Email", data["email"]);

    prefs.setString("Password", data["password"]);
    prefs.setString("ApiKey", data["apikey"]);
    prefs.setBool("lendingpage", true);

    // if (isRememberMe) {
    //  // emailLogin = widget.userDetails.email;
    //   prefs.setBool("introPage", true);
    // }

    prefs.setBool("isRememberMe", true);

    print('saved $data');
    globals.userId = data["userId"];
    globals.email = data["userEmail"];
    globals.apikey = data["apikey"];
    globals.isLoggedIn = true;
  }

  void _validateInputLogin() {
    AccountService service = new AccountService();

    if (_formKeyLogin.currentState.validate()) {
      _formKeyLogin.currentState.save();
      AlertMessage().onLoading(context);
      // print("emailLogin===$emailLogin");
      // print("passwordLogin===$passwordLogin");
      service.userLogin(email, password).then((res) {
        if (res.status) {
          print("a");
          Navigator.pop(context);

          saveData(res.data);
          {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => HomePage()));
          }

          // showMessage(res.message);

        } else {
          print("ab");
          if (res.data != null) {
            if (res.data["isVerified"] == 0) {
              Navigator.pop(context);
              AlertMessage().showMessages(res.message);
            }
          } else {
            Navigator.pop(context);

            AlertMessage().showMessages(res.message);
          }
        }
      }).catchError((onError) {
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
}