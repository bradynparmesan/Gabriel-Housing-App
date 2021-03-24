import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../styles.dart';

class AboutPage extends StatefulWidget {
  @override
  AboutScreen createState() => AboutScreen();
}

class AboutScreen extends State<AboutPage> with TickerProviderStateMixin {
  int currentIndex = 0;
  TextEditingController _numberCtrl = new TextEditingController();
  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "085921191121";
  }

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
                //padding: const EdgeInsets.only(left: 15),
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
          children: <Widget>[buildabout(context)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<bool> _onBackPressed() {
    SystemNavigator.pop(); //  exit(0);
    return Future.value(false);
  }

  Widget buildabout(BuildContext context) {
    return ListView(children: [
      Container(
        padding: const EdgeInsets.all(20),
        child: Text(
            'Gabriel Housing Corporation has provided safe, sustainable, affordable housing to Métis people in the City of Regina since 1981. GHC currently owns and operates 359 units, consisting of single family dwellings, senior complexes and apartments located throughout the City of Regina.  Gabriel Housing Corporation’s head office is also net-zero, and is 100% powered by solar energy!',
            style: TextStyle(
                color: Colors.black,
                fontFamily: Styles.fontFamilyMedium,
                fontSize: 13),
            textAlign: TextAlign.left),
      ),
      SizedBox(height: 10),
      Container(
          //padding: const EdgeInsets.all(200),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            // color: Colors.lightBlueAccent,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            image: new DecorationImage(
              image: new ExactAssetImage("assets/img/ghc1.png"),
              fit: BoxFit.cover,
            ),
            // gradient: LinearGradient(
            //   colors: [Colors.white, Colors.black26],
            // ),
          )),
      SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          "CONTACT US",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      Container(
          child: Row(
        children: [
          Container(
            child: Container(
                child: IconButton(
                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    onPressed: null)),
          ),
          Container(
            child: Text(
              'Email :',
              style: TextStyle(
                fontSize: 18,
                color: Styles.buttoncolor,
              ),
            ),
          ),
          Container(
              child: Linkify(
            onOpen: _onOpen,
            text: "reception@gabrielhousing.com",
            style: TextStyle(
              fontSize: 16,
            ),
          ))
        ],
      )),
      Container(
          child: Row(
        children: [
          Container(
            child: Container(
                child: IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    onPressed: null)),
          ),
          Container(
            child: Text(
              'Phone :',
              style: TextStyle(
                fontSize: 18,
                color: Styles.buttoncolor,
              ),
            ),
          ),
          Container(
              child: Linkify(
            onOpen: _onPhone,
            text: "306-775-2905",
            style: TextStyle(
              fontSize: 15,
            ),
            // child:FlatButton(
            // child: Text("Test Call"),
            // onPressed: () async{
            //   FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
            // },
            //   )
          ))
        ],
      ))
    ]);
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }

  Future<void> _onPhone(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
