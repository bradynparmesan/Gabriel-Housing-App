import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:ghcmobile/home/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles.dart';
import 'package:ghcmobile/home/privacy_screen.dart';

class AboutPage extends StatefulWidget {
  @override
  AboutScreen createState() => AboutScreen();
}

class AboutScreen extends State<AboutPage> with TickerProviderStateMixin {
  //int currentIndex = 3;
  int currentIndex;
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
              context, new MaterialPageRoute(builder: (context) => HomePage())),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          //change your color here
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SizedBox(width:55),
            Container(
                width: MediaQuery.of(context).size.width / 1.7,
                alignment: Alignment.center,
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
          children: <Widget>[buildabout(context)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<bool> _onBackPressed() {
    print("about===object===");
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));

    return Future.value(true);
  }

  Widget buildabout(BuildContext context) {
    return ListView(children: [
      Container(
        padding: const EdgeInsets.all(20),
        child: Text(
            'Gabriel Housing Corporation has provided safe, sustainable, affordable housing to Métis people in the City of Regina since 1981. GHC currently owns and operates 359 units, consisting of single family dwellings, senior complexes and apartments located throughout the City of Regina. Gabriel Housing Corporation’s head office is also net-zero, and is 100% powered by solar energy!',
            style: TextStyle(
                color: Colors.black,
                fontFamily: Styles.fontFamilyMedium,
                fontSize: 13),
            textAlign: TextAlign.left),
      ),
      SizedBox(height: 10),
      Container(
          //padding: const EdgeInsets.all(200),
          // width: 100,
          height: 280,
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
              fontSize: 15,
              color: Colors.black,
              fontFamily: Styles.fontFamilyBold),
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
              'Email:',
              style: TextStyle(
                  fontSize: 15,
                  color: Styles.buttoncolor,
                  fontFamily: Styles.fontFamilyBold),
            ),
          ),
          Container(
              child: Linkify(
            onOpen: _onOpen,
            text: " reception@gabrielhousing.com",
            style: TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
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
              'Phone:',
              style: TextStyle(
                  fontSize: 15,
                  color: Styles.buttoncolor,
                  fontFamily: Styles.fontFamilyBold),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 3),
              child: Linkify(
                onOpen: _onPhone,
                text: " 306-775-2905",
                style: TextStyle(
                    fontSize: 13, fontFamily: Styles.fontFamilyMedium),
                // child:FlatButton(
                // child: Text("Test Call"),
                // onPressed: () async{
                //   FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                // },
                //   )
              ))
        ],
      )),
      SizedBox(height: 10),
      Container(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            child: Text(
              'Personal Information Privacy Policy',
              style: TextStyle(
                  fontSize: 18,
                  color: Styles.buttoncolor,
                  fontFamily: Styles.fontFamilyMedium,
                  decoration: TextDecoration.underline),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => PrivacyPage()));
            },
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
