import 'package:flutter/material.dart';

import '../styles.dart';

class ApplyScreen extends StatefulWidget {
  @override
  ApplyScreenState createState() => ApplyScreenState();
}

class ApplyScreenState extends State<ApplyScreen> {
  final _formKey = GlobalKey<FormState>();
  String _memberValue;
  String radioValue;
  String houseValue;
  String choice;
  String legalName;
  String address;
  String city;
  String email;
  String phoneNumber;
  String dependts;
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
            SizedBox(width:100),
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
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
                // onSaved: (String val) {
                //   name = val;
                //   // emailReg = val.trim();
                // },
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
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
                // onSaved: (String val) {
                //   name = val;
                //   // emailReg = val.trim();
                // },
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
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
                // onSaved: (String val) {
                //   name = val;
                //   // emailReg = val.trim();
                // },
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
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
                // onSaved: (String val) {
                //   name = val;
                //   // emailReg = val.trim();
                // },
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
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
                // validator: Validator.validateName,
                // onSaved: (String val) {
                //   name = val;
                //   // emailReg = val.trim();
                // },
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
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
                // validator: Validator.validateName,
                // onSaved: (String val) {
                //   name = val;
                //   // emailReg = val.trim();
                // },
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
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
                // onSaved: (String val) {
                //   name = val;
                //   // emailReg = val.trim();
                // },
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
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     new MaterialPageRoute(
                      //         builder: (context) => CreatAccountScreen()));
                    }
                    // _validatorLogin,
                    ),
              )
            ]));
  }

  void radioMemberChanges(String value) {
    setState(() {
      _memberValue = value;
      switch (value) {
        case 'one':
          value = "New Unit";
          break;
        case 'two':
          value = "Transfer";
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
          value = "Metis";
          break;
        case 'two':
          value = "First Nation/Inuit";
          break;
        case 'three':
          value = "Not indigenonus";
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
          value = "1-Bed";
          break;
        case 'two':
          value = "2-Bed";
          break;
        case 'three':
          value = "3-Bed";
          break;
        case 'four':
          value = "4+Bed";
          break;

        default:
          choice = null;
      }
      // debugPrint(genderReg); //Debug the choice in console
    });
  }
}
