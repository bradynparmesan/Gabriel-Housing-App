import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ghcmobile/alert_message.dart';
import 'package:ghcmobile/main/validator.dart';
import 'package:ghcmobile/service/account_service.dart';

import '../styles.dart';
import 'login_screen.dart';

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

  bool loginObscureText = true;

  String choice;
  bool _autoValidate = false;
  String name;
  String password;
  String firstName;
  String lastName;
  String email;
  bool ghcMember;
  bool ghcTenant;
  String _radioValue;
  String _memberValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            child: Form(
                key: _formKeyRegister,
                autovalidate: _autoValidate,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: Container(
                            width: 200,
                            height: 150,
                            /*decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50.0)),*/
                            child: Image.asset('assets/img/landing-logo.png')),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.18,

                        // padding: const EdgeInsets.only(right: 240),
                        child: Text('FIRST NAME', style: Styles.headerText)),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                      child: TextFormField(
                        controller: firstnameController,
                        textInputAction: TextInputAction.next,
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
                          hintText: 'First Name',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/img/01-user-gray.png',
                              height: 20,
                            ),
                            iconSize: 25,
                            color: Colors.grey[400],
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontFamily: Styles.fontFamilyMedium,
                          ),
                        ),
                        validator: Validator.validateFirstName,
                        onSaved: (String val) {
                          firstName = val;
                          FocusScope.of(context).requestFocus(FocusNode());

                          // emailReg = val.trim();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.18,
                        child: Text('LAST NAME', style: Styles.headerText)),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                      child: TextFormField(
                        controller: lastnameController,
                        textInputAction: TextInputAction.next,
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
                          hintText: 'Last Name',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/img/01-user-gray.png',
                              height: 20,
                            ),
                            iconSize: 25,
                            color: Colors.grey[400],
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontFamily: Styles.fontFamilyMedium,
                          ),
                        ),
                        validator: Validator.validateLastName,
                        onSaved: (String val) {
                          lastName = val;
                          FocusScope.of(context).requestFocus(FocusNode());

                          // emailReg = val.trim();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.18,
                        child: Text('EMAIL', style: Styles.headerText)),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                      child: TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
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
                          hintText: 'Email',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/img/05-message-gray.png',
                              height: 20,
                            ),
                            iconSize: 25,
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
                          FocusScope.of(context).requestFocus(FocusNode());

                          // emailReg = val.trim();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.17,
                        child: Text('PASSWORD', style: Styles.headerText)),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                      child: TextFormField(
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: loginObscureText,
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
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/img/02-password-gray.png',
                              height: 20,
                            ),
                            iconSize: 25,
                            color: Colors.grey[400],
                          ),
                          errorMaxLines: 2,
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontFamily: Styles.fontFamilyMedium,
                          ),
                        ),
                        validator: Validator.validPassword,
                        onSaved: (String val) {
                          password = val;
                          FocusScope.of(context).requestFocus(FocusNode());

                          // emailReg = val.trim();
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.17,
                        child: Text('ARE YOU A GHC MEMBER?',
                            style: Styles.headerText)),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.10,
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
                    Container(
                        width: MediaQuery.of(context).size.width / 1.17,
                        child: Text('ARE YOU A GHC TENANT?',
                            style: Styles.headerText)),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.10,
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
                    Container(
                        width: MediaQuery.of(context).size.width / 1.17,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: new TextSpan(children: [
                                      TextSpan(
                                        text: 'Already Registered? ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Styles.buttoncolor,
                                          fontFamily: Styles.fontFamilyMedium,
                                        ),
                                        //  recognizer: new TapGestureRecognizer()
                                        //    ..onTap = () {

                                        //   },
                                      ),
                                      TextSpan(
                                        text: 'Login here',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Styles.buttoncolor,
                                            fontFamily: Styles.fontFamilyMedium,
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()));
                                          },
                                      )
                                    ]))),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        )),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      height: 50,
                      width: 300,
                      child: RaisedButton(
                        child: Text(
                          "REGISTER",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Styles.fontFamilyBold,
                            fontSize: 20,
                          ),
                        ),
                        color: Styles.buttoncolor,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        onPressed: _validatorAccountReg,
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: buildBottomBarButton(),
    );
  }

  // Widget buildBottomBarButton() {
  //   return BottomAppBar(
  //       shape: CircularNotchedRectangle(),
  //       child: new Row(
  //           mainAxisSize: MainAxisSize.max,
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: <Widget>[
  //             Container(
  //               padding: const EdgeInsets.only(bottom: 5),
  //               height: 45,
  //               width: 300,
  //               child: RaisedButton(
  //                 child: Text('REGISTER',
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontFamily: Styles.fontFamilyBold,
  //                         fontSize: 22,
  //                         fontWeight: FontWeight.bold)),
  //                 color: Styles.buttoncolor,
  //                 shape: new RoundedRectangleBorder(
  //                   borderRadius: new BorderRadius.circular(5.0),
  //                 ),
  //                 onPressed: _validatorAccountReg,
  //               ),
  //             )
  //           ]));
  // }

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
          0, firstName, lastName, email, password, ghcMember, ghcTenant);
      if (ghcMember == null) {
        print("ghcMember=====$ghcMember");
        Navigator.pop(context);
        AlertMessage().showMessages("Please choose your ghc member");
        return null;
      }
      if (ghcTenant == null) {
        print("ghcTenant=====$ghcTenant");
        Navigator.pop(context);
        AlertMessage().showMessages("Please choose your ghc tenant");
        return null;
      }
      service.userRegister(registerModel).then((responce) {
        Navigator.pop(context);

        if (responce.status) {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => LoginScreen()));

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

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          ghcTenant = true;
          break;
        case 'two':
          ghcTenant = false;
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
          ghcMember = true;
          break;
        case 'two':
          ghcMember = false;
          break;

        default:
          choice = null;
      }
      // debugPrint(genderReg); //Debug the choice in console
    });
  }
}
