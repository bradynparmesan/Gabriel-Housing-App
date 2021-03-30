import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghcmobile/styles.dart';

class MessageScreen extends StatefulWidget {
  @override
  MessageScreenState createState() => MessageScreenState();
}

class MessageScreenState extends State<MessageScreen> {
  bool checkboxValue = false;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(
      //     color: Colors.black,
      //     //change your color here
      //   ),
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       SizedBox(width:100),
      //       Container(
      //           // padding: const EdgeInsets.all(10),
      //           // width: 220,
      //           // height: 150,
      //           // alignment: Alignment.center,
      //           child: Image.asset(
      //             "assets/img/logo.jpeg",
      //             fit: BoxFit.contain,
      //             height: 32,
      //           ))
      //     ],
      //   ),
      // ),
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
            child: Column(
          children: [
            Container(
                child: Row(
              children: [
                Container(
                  child: Checkbox(
                      value: checkboxValue,
                      onChanged: (value) {
                        setState(() {
                          checkboxValue = value;
                          // state.didChange(value);
                        });
                      }),
                ),
                Container(
                  child: Text('Message',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: Styles.fontFamilyMedium)),
                ),
              ],
            )),
            SizedBox(
              height: 50,
            ),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 45,
                  child: RaisedButton(
                      color: Styles.buttoncolor,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Delete',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onPressed: () {
                        //Actions
                      }),
                ),
              ],
            )),
          ],
        ))
      ],
    );
  }

  Future<bool> _onBackPressed() {
    return Future.value();
  }
}
