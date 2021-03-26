import 'package:flutter/material.dart';
import 'package:ghcmobile/alert_message.dart';
import 'package:ghcmobile/main/validator.dart';
import 'package:ghcmobile/model/commom_model.dart';
import 'package:ghcmobile/service/account_service.dart';
import 'package:ghcmobile/models/globals.dart' as globals;

import '../styles.dart';

class ApplyScreen extends StatefulWidget {
  @override
  ApplyScreenState createState() => ApplyScreenState();
}

class ApplyScreenState extends State<ApplyScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final indigenonusController = TextEditingController();
  final legalNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final postalController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final dependentsController = TextEditingController();

  String _memberValue;
  String radioValue;
  String houseValue;
  String choice;
  String applyFor;
  String indigeonus;
  String housingNeed;
  String legalName;
  String address;
  String city;
  String email;
  String postalCode;
  String phoneNumber;
  String dependents;
  bool _autoValidate = false;

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
                child: Image.asset(
              "assets/img/logo.jpeg",
              fit: BoxFit.contain,
              height: 32,
            ))
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: null,
        child: Stack(
          children: <Widget>[applyPage(context)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomBarButton(),
    );
  }

  Widget applyPage(BuildContext context) {
    return ListView(children: [
      Container(
        padding: const EdgeInsets.all(20),
        child: Text(
            'You may apply for housing (new unit or request a transfer) using this submission form. Please provide all requested information as part of your application package. A GHC staff member will reach out to you for proof of identity and income to support your application. All information will be treated as confidential, in accordance with personal information privacy laws in Saskatchewan.',
            style: TextStyle(
                color: Colors.black,
                fontFamily: Styles.fontFamilyMedium,
                fontSize: 13),
            textAlign: TextAlign.left),
      ),
      Container(
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(children: [
            Container(
                width: MediaQuery.of(context).size.width / 1.20,
                // padding: const EdgeInsets.only(right: 210),
                child: Text('Full Legal Name:',
                    style: TextStyle(
                        color: Styles.buttoncolor,
                        fontFamily: Styles.fontFamilyBold,
                        fontSize: 15))),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
              child: TextFormField(
                controller: legalNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: '',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: Styles.fontFamilyMedium,
                  ),
                ),
                validator: Validator.validateName,
                onSaved: (String val) {
                  legalName = val;
                  // emailReg = val.trim();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.20,
                child: Text('Current Address:',
                    style: TextStyle(
                        color: Styles.buttoncolor,
                        fontFamily: Styles.fontFamilyBold,
                        fontSize: 15))),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
              child: TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: '',
                  // suffixIcon: IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.person_outline_outlined),
                  //   color: Colors.grey[400],
                  // ),
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: Styles.fontFamilyMedium,
                  ),
                ),
                validator: Validator.validateName,
                onSaved: (String val) {
                  address = val;
                  // emailReg = val.trim();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.20,
                child: Text('City:',
                    style: TextStyle(
                        color: Styles.buttoncolor,
                        fontFamily: Styles.fontFamilyBold,
                        fontSize: 15))),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
              child: TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: '',
                  // suffixIcon: IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.person_outline_outlined),
                  //   color: Colors.grey[400],
                  // ),
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: Styles.fontFamilyMedium,
                  ),
                ),
                validator: Validator.validateName,
                onSaved: (String val) {
                  city = val;
                  // emailReg = val.trim();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.20,
                child: Text('Postal Code:',
                    style: TextStyle(
                        color: Styles.buttoncolor,
                        fontFamily: Styles.fontFamilyBold,
                        fontSize: 15))),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
              child: TextFormField(
                controller: postalController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: '',
                  // suffixIcon: IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.person_outline_outlined),
                  //   color: Colors.grey[400],
                  // ),
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: Styles.fontFamilyMedium,
                  ),
                ),
                // validator: Validator.validateName,
                onSaved: (String val) {
                  postalCode = val;
                  // emailReg = val.trim();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.20,
                child: Text('Phone Number:',
                    style: TextStyle(
                        color: Styles.buttoncolor,
                        fontFamily: Styles.fontFamilyBold,
                        fontSize: 15))),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
              child: TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: '',
                  // suffixIcon: IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.phone_android_outlined),
                  //   color: Colors.grey[400],
                  // ),
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: Styles.fontFamilyMedium,
                  ),
                ),
                validator: Validator.validateMobile,
                onSaved: (String val) {
                  phoneNumber = val;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.20,
                child: Text('Email Address:',
                    style: TextStyle(
                        color: Styles.buttoncolor,
                        fontFamily: Styles.fontFamilyBold,
                        fontSize: 15))),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: '',
                  // suffixIcon: IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.mail_outline_outlined),
                  //   color: Colors.grey[400],
                  // ),
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: Styles.fontFamilyMedium,
                  ),
                ),
                validator: Validator.validateEmail,
                onSaved: (String val) {
                  email = val;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.20,
                child: Text('Number of Dependents:',
                    style: TextStyle(
                        color: Styles.buttoncolor,
                        fontFamily: Styles.fontFamilyBold,
                        fontSize: 15))),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
              child: TextFormField(
                controller: dependentsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: '',
                  // suffixIcon: IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.person_outline_outlined),
                  //   color: Colors.grey[400],
                  // ),
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: Styles.fontFamilyMedium,
                  ),
                ),
                validator: Validator.validateName,
                onSaved: (String val) {
                  dependents = val;
                  // emailReg = val.trim();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.20,
                child: Text('Housing Need:',
                    style: TextStyle(
                        color: Styles.buttoncolor,
                        fontFamily: Styles.fontFamilyBold,
                        fontSize: 15))),
            Container(
                width: MediaQuery.of(context).size.width / 1.22,
                child: new Theme(
                  data: new ThemeData(
                    primarySwatch: Styles.appColor,
                    unselectedWidgetColor: Colors.black,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                          scale: 1.1,
                          child: Radio(
                            value: 'one',
                            groupValue: houseValue,
                            onChanged: housevalueChanges,
                          )),
                      Text(
                        "1-Bed",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: Styles.fontFamilyMedium),
                      ),
                      Transform.scale(
                          scale: 1.1,
                          child: Radio(
                            value: 'two',
                            groupValue: houseValue,
                            onChanged: housevalueChanges,
                          )),
                      Text(
                        "2-Bed",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: Styles.fontFamilyMedium),
                      ),
                    ],
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width / 1.22,
                child: new Theme(
                    data: new ThemeData(
                      primarySwatch: Styles.appColor,
                      unselectedWidgetColor: Colors.black,
                    ),
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                              scale: 1.1,
                              child: Radio(
                                value: 'three',
                                groupValue: houseValue,
                                onChanged: housevalueChanges,
                              )),
                          Text(
                            "3-Bed",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: Styles.fontFamilyMedium),
                          ),
                          Transform.scale(
                              scale: 1.1,
                              child: Radio(
                                value: 'four',
                                groupValue: houseValue,
                                onChanged: housevalueChanges,
                              )),
                          Text(
                            "4+Bed",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: Styles.fontFamilyMedium),
                          ),
                        ]))),
            Container(
                width: MediaQuery.of(context).size.width / 1.20,
                child: Text('What are you applying for?',
                    style: TextStyle(
                        color: Styles.buttoncolor,
                        fontFamily: Styles.fontFamilyBold,
                        fontSize: 15))),
            Container(
                width: MediaQuery.of(context).size.width / 1.22,
                child: new Theme(
                  data: new ThemeData(
                    primarySwatch: Styles.appColor,
                    unselectedWidgetColor: Colors.black,
                  ),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                          scale: 1.1,
                          child: Radio(
                            value: 'one',
                            groupValue: _memberValue,
                            onChanged: radioMemberChanges,
                          )),
                      Text(
                        "New Unit",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
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
                        "Transfer",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: Styles.fontFamilyMedium),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.20,
                child: Text('Are you indigenonus?',
                    style: TextStyle(
                        color: Styles.buttoncolor,
                        fontFamily: Styles.fontFamilyBold,
                        fontSize: 15))),
            Container(
                width: MediaQuery.of(context).size.width / 1.22,
                child: new Theme(
                  data: new ThemeData(
                    primarySwatch: Styles.appColor,
                    unselectedWidgetColor: Colors.black,
                  ),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                          scale: 1.1,
                          child: Radio(
                            value: 'one',
                            groupValue: radioValue,
                            onChanged: radioChanges,
                          )),
                      Text(
                        "Metis",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: Styles.fontFamilyMedium),
                      ),
                      Transform.scale(
                          scale: 1.1,
                          child: Radio(
                            value: 'two',
                            groupValue: radioValue,
                            onChanged: radioChanges,
                          )),
                      Text(
                        "First Nation/Inuit",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: Styles.fontFamilyMedium),
                      ),
                    ],
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width / 1.22,
                child: new Theme(
                    data: new ThemeData(
                      primarySwatch: Styles.appColor,
                      unselectedWidgetColor: Colors.black,
                    ),
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                              scale: 1.1,
                              child: Radio(
                                value: 'three',
                                groupValue: radioValue,
                                onChanged: radioChanges,
                              )),
                          Text(
                            "Not indigenonus",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: Styles.fontFamilyMedium),
                          ),
                        ]))),
          ]),
        ),
      ),
    ]);
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
                  child: Text('SUBMIT',
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
            ]));
  }

  _applyUserData() {
    AccountService service = new AccountService();

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //  AlertMessage().onLoading(context);
      // print("registerModel:$registerModel")
      UserApply userApply = new UserApply();
      userApply.userId = globals.userId;

      userApply.email = emailController.text;
      userApply.fullLegalName = legalNameController.text;
      userApply.indigenonus = indigeonus;
      userApply.address = addressController.text;
      userApply.city = cityController.text;
      userApply.postalCode = postalController.text;
      userApply.phoneNumber = phoneNumberController.text;
      userApply.dependents = dependentsController.text;
      userApply.housingNeed = housingNeed;
      userApply.applyFor = applyFor;

      service.userApplyData(userApply).then((responce) {
        if (responce.status) {
          Navigator.of(context).pop();
          AlertMessage().showMessages(responce.message);
        } else {
          Navigator.pop(context);

          AlertMessage().showMessages(responce.message);
          print('error  : ${responce.message}');
        }
      }).catchError((error) {
        // Navigator.pop(context);
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

  void radioMemberChanges(String value) {
    setState(() {
      _memberValue = value;
      switch (value) {
        case 'one':
          applyFor = "New Unit";
          break;
        case 'two':
          applyFor = "Transfer";
          break;

        default:
          choice = null;
      }
      // debugPrint(genderReg); //Debug the choice in console
    });
  }

  void radioChanges(String value) {
    setState(() {
      radioValue = value;
      switch (value) {
        case 'one':
          indigeonus = "Metis";
          break;
        case 'two':
          indigeonus = "First Nation/Inuit";
          break;
        case 'three':
          indigeonus = "Not indigenonus";
          break;

        default:
          choice = null;
      }
      // debugPrint(genderReg); //Debug the choice in console
    });
  }

  void housevalueChanges(String value) {
    setState(() {
      houseValue = value;
      switch (value) {
        case 'one':
          housingNeed = "1-Bed";
          break;
        case 'two':
          housingNeed = "2-Bed";
          break;
        case 'three':
          housingNeed = "3-Bed";
          break;
        case 'four':
          housingNeed = "4+Bed";
          break;

        default:
          choice = null;
      }
      // debugPrint(genderReg); //Debug the choice in console
    });
  }
}
