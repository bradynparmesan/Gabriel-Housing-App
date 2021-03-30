import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghcmobile/main/validator.dart';
import 'package:ghcmobile/styles.dart';

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
      ),
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
                                hintText: '',
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
                        ],
                      )),
                ),
              ],
            ))
      ],
    );
  }

  void _applyUserData() {}

  Future<bool> _onBackPressed() {
    return Future.value();
  }
}
