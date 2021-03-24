import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ghcmobile/alert_message.dart';
import 'package:ghcmobile/main/validator.dart';
import 'package:ghcmobile/service/account_service.dart';


import '../styles.dart';

class CreatAccountScreen extends StatefulWidget {
  @override
  CreatAccountScreenState createState() => CreatAccountScreenState();
}

class CreatAccountScreenState extends State<CreatAccountScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();

  final _formKeyRegister = GlobalKey<FormState>();

  String choice;
  bool _autoValidate = false;
  String name;
  String password;
  String firstName;
  String lastName;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            child: Form(
                key: _formKeyRegister,
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
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,

                        // padding: const EdgeInsets.only(right: 240),
                        child: Text('FIRSTNAME', style: Styles.headerText)),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                      child: TextFormField(
                        controller: firstnameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Firstname',
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
                        validator: Validator.validateName,
                        onSaved: (String val) {
                          firstName = val;
                          // emailReg = val.trim();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text('LASTNAME', style: Styles.headerText)),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                      child: TextFormField(
                        controller: lastnameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Lastname',
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
                        validator: Validator.validateName,
                        onSaved: (String val) {
                          lastName = val;
                          // emailReg = val.trim();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text('EMAIL', style: Styles.headerText)),
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
                          hintText: 'Email',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.email_outlined),
                            color: Colors.grey[400],
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontFamily: Styles.fontFamilyMedium,
                          ),
                        ),
                        validator: Validator.validateEmail,
                        onSaved: (String val) {
                          email = val;
                          // emailReg = val.trim();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text('PASSWORD', style: Styles.headerText)),
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
                                    text: 'LOGIN',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Styles.buttoncolor,
                                        fontFamily: Styles.fontFamilyMedium,
                                        decoration: TextDecoration.underline),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    CreatAccountScreen()));
                                      },
                                  )
                                ])))
                      ],
                    )),
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
                  child: Text('REGISTER',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: Styles.fontFamilyBold,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  color: Styles.buttoncolor,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  onPressed: _validatorAccountReg,
                ),
              )
            ]));
  }

  // void radioButtonChanges(String value) {
  //   setState(() {
  //     _radioValue = value;
  //     switch (value) {
  //       case 'one':
  //         value = "Yes";
  //         break;
  //       case 'two':
  //         value = "No";
  //         break;

  //       default:
  //         choice = null;
  //     }
  //     // debugPrint(genderReg); //Debug the choice in console
  //   });
  // }

  // void radioMemberChanges(String value) {
  //   setState(() {
  //     _memberValue = value;
  //     switch (value) {
  //       case 'one':
  //         value = "Yes";
  //         break;
  //       case 'two':
  //         value = "No";
  //         break;

  //       default:
  //         choice = null;
  //     }
  //     // debugPrint(genderReg); //Debug the choice in console
  //   });
  // }

  void _validatorAccountReg() {
    AccountService service = new AccountService();

    if (_formKeyRegister.currentState.validate()) {
      _formKeyRegister.currentState.save();
      AlertMessage().onLoading(context);
      // print("registerModel:$registerModel")
      UserRegisterModel registerModel = new UserRegisterModel(
        0,
        firstName,
        lastName,
        email,
        password,
      );
      service.userRegister(registerModel).then((responce) {
        if (responce.status) {
          Navigator.of(context).pop();
          AlertMessage().showMessages(responce.message);
          setState(() {
            firstName = "";
            firstnameController.text = "";
            lastName = "";
            lastnameController.text = "";
            email = "";
            emailController.text = "";
            password = "";
            passwordController.text = "";

            // this._tabController.index = 0;
          });
        } else {
          Navigator.pop(context);

          AlertMessage().showMessages(responce.message);
          print('error  : ${responce.message}');
        }
      }).catchError((error) {
        Navigator.pop(context);
        Navigator.pop(context);
        print('error reg : $error');
        // print('error  : ${responce.message}');
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
