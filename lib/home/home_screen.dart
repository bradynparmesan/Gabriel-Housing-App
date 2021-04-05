import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghcmobile/admin/user_admin.dart';
import 'package:ghcmobile/landing_screen.dart';

import '../styles.dart';
import 'about_screen.dart';
import 'apply_screen.dart';
import 'maintenance_screen.dart';
import 'message_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ghcmobile/models/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<HomePage> with TickerProviderStateMixin {
  List<Tab> tabList = List();
  TabController _tabController;
  String userId;
  int _currentIndex = 2;
  int currentIndex = 2;
  @override
  void initState() {
    read();

    tabList.add(new Tab(
      text: 'Message',
      icon: Image.asset(
        'assets/img/05-message-gray.png',
        width: 25,
        color: Colors.white,
      ),
    ));
    tabList.add(new Tab(
      text: 'Apply',
      icon: Image.asset(
        'assets/img/04-apply-gray.png',
        width: 25,
        color: Colors.white,
      ),
    ));
    tabList.add(new Tab(
      text: 'Home',
      icon: Image.asset(
        'assets/img/03-home-gray.png',
        width: 25,
        color: Colors.white,
      ),
    ));
    tabList.add(new Tab(
      text: 'About us',
      icon: Image.asset(
        'assets/img/07-about-gray.png',
        width: 25,
        color: Colors.white,
      ),
    ));
    tabList.add(new Tab(
      text: 'Maintenance',
      icon: Image.asset(
        'assets/img/06-mainten-gray.png',
        width: 25,
        color: Colors.white,
      ),
    ));
    _tabController = new TabController(
        vsync: this, length: tabList.length, initialIndex: _currentIndex);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
    print("======cal tabselection=====");
    // read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          // children: <Widget>[buildapp(context),
          // // AboutPage(),
          // // MaintenancePage()
          // ],
          children: <Widget>[
            Container(
                //  padding: EdgeInsets.only(top:500),
                child: TabBarView(
              controller: _tabController,
              children: [
                MessageScreen(),
                ApplyScreen(),
                buildapp(context),
                AboutPage(),
                MaintenancePage(),
              ],
            )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
          height: 60,
          color: Styles.navcolor,
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 6),
            // indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelStyle: TextStyle(fontSize: 6),
            indicatorColor: Colors.orange,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    //  topLeft: Radius.circular(10),
                    //  topRight: Radius.circular(5)
                    ),
                color: Styles.buttoncolor),
            onTap: (int index) {
              _currentIndex = index;
              print("onTap:$_currentIndex");
              setState(() {
                _tabController.index = index;
              });

              // read();
            },
            tabs: tabList,
          )),
    );
  }

  Future<bool> _onBackPressed() {
    SystemNavigator.pop();
    return Future.value(true);
  }

  Widget buildapp(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.white,
              //change your color here
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    // width: 220,
                    // height: 150,
                    alignment: Alignment.center,
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
                                          builder: (context) =>
                                              LandingScreen()));
                                },
                            )
                          ])))
                ],
              )),
            ]),
        body: ListView(
          children: [
            SizedBox(height: 70),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 200,
                  child: Card(
                      elevation: 5,
                      margin: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            // width: MediaQuery.of(context).size.width / 2,
                            // height: MediaQuery.of(context).size.height / 4,
                            //width: screenWidth,

                            //width:100,
                            height: 150,
                            margin: EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              color: Styles.buttoncolor,

                              border: Border.all(
                                color: Colors.white,
                                width: 18,
                              ),
                              // borderRadius: BorderRadius.circular(28),
                              // image: DecorationImage(
                              //   image: AssetImage(widget.image),
                              //   fit: BoxFit.fill,
                              // )
                            ),
                            child: IconButton(
                                icon: Image.asset(
                                  'assets/img/04-apply-icon.png',
                                  width: 40,
                                  color: Colors.white,
                                ),
                                iconSize: 100.0,
                                onPressed: () async {
                                  print("messagesssssss");
                                  setState(() {
                                    _currentIndex = 1;
                                    _tabController.index = 1;
                                  });
                                  // await Navigator.push(
                                  //     context,
                                  //     new MaterialPageRoute(
                                  //         builder: (context) => MessageScreen()));
                                }),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Text(
                                      'APPLY',
                                      style: TextStyle(
                                        fontFamily: Styles.fontFamilyBold,
                                        fontSize: 15,
                                      ),
                                    ))
                                  ],
                                ))
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  width: 150,
                  height: 200,
                  child: Card(
                      elevation: 5,
                      margin: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            // width: MediaQuery.of(context).size.width / 2,
                            // height: MediaQuery.of(context).size.height / 4,
                            //width: screenWidth,

                            //width:100,
                            height: 150,
                            margin: EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              color: Styles.buttoncolor,

                              border: Border.all(
                                color: Colors.white,
                                width: 18,
                              ),
                              // borderRadius: BorderRadius.circular(28),
                              // image: DecorationImage(
                              //   image: AssetImage(widget.image),
                              //   fit: BoxFit.fill,
                              // )
                            ),
                            child: IconButton(
                                icon: Image.asset(
                                  'assets/img/05-message-icon.png',
                                  width: 40,
                                  color: Colors.white,
                                ),
                                iconSize: 100.0,
                                onPressed: () async {
                                  print("messagesssssss");
                                  setState(() {
                                    _currentIndex = 0;
                                    _tabController.index = 0;
                                  });
                                  // await Navigator.push(
                                  //     context,
                                  //     new MaterialPageRoute(
                                  //         builder: (context) => MessageScreen()));
                                }),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Text(
                                      'MESSAGES',
                                      style: TextStyle(
                                        fontFamily: Styles.fontFamilyBold,
                                        fontSize: 15,
                                      ),
                                    ))
                                  ],
                                ))
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ],
            )),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 200,
                  child: Card(
                      elevation: 5,
                      margin: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            // width: MediaQuery.of(context).size.width / 2,
                            // height: MediaQuery.of(context).size.height / 4,
                            //width: screenWidth,

                            //width:100,
                            height: 150,
                            margin: EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              color: Styles.buttoncolor,

                              border: Border.all(
                                color: Colors.white,
                                width: 18,
                              ),
                              //borderRadius: BorderRadius.circular(28),
                              // image: DecorationImage(
                              //   image: AssetImage(widget.image),
                              //   fit: BoxFit.fill,
                              // )
                            ),
                            child: IconButton(
                                icon: Image.asset(
                                  'assets/img/06-mainten-icon.png',
                                  width: 40,
                                  color: Colors.white,
                                ),
                                iconSize: 100.0,
                                onPressed: () async {
                                  setState(() {
                                    _currentIndex = 4;
                                    _tabController.index = 4;
                                  });
                                  // await Navigator.push(
                                  //     context,
                                  //     new MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             MaintenancePage()));
                                }),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 120,
                                ),
                                Container(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '      MAINTENANCE',
                                      style: TextStyle(
                                        fontFamily: Styles.fontFamilyBold,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '   REQUEST',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: Styles.fontFamilyBold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    // Container(
                                    //     child: Text(
                                    //   "MAINTENANCE REQUEST",
                                    //   maxLines: 4,
                                    //   softWrap: false,
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: TextStyle(
                                    //     fontFamily: Styles.fontFamilyBold,
                                    //     fontSize: 15,
                                    //   ),
                                    // )),
                                  ],
                                ))
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  width: 150,
                  height: 200,
                  child: Card(
                      elevation: 5,
                      margin: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            // width: MediaQuery.of(context).size.width / 2,
                            // height: MediaQuery.of(context).size.height / 4,
                            //width: screenWidth,

                            //width:100,
                            height: 150,
                            margin: EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              color: Styles.buttoncolor,

                              border: Border.all(
                                color: Colors.white,
                                width: 18,
                              ),
                              // borderRadius: BorderRadius.circular(28),
                              // image: DecorationImage(
                              //   image: AssetImage(widget.image),
                              //   fit: BoxFit.fill,
                              // )
                            ),
                            child: IconButton(
                                icon: Image.asset(
                                  'assets/img/07-about-icon.png',
                                  // height: 20,
                                  width: 40,
                                  color: Colors.white,
                                  //
                                ),
                                iconSize: 100.0,
                                onPressed: () async {
                                  setState(() {
                                    _currentIndex = 3;
                                    _tabController.index = 3;
                                  });
                                  // await Navigator.push(
                                  //     context,
                                  //     new MaterialPageRoute(
                                  //         builder: (context) => AboutPage()));
                                }),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Text(
                                      'ABOUT US',
                                      style: TextStyle(
                                        fontFamily: Styles.fontFamilyBold,
                                        fontSize: 15,
                                      ),
                                    ))
                                  ],
                                ))
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ],
            )),
          ],
        ));
  }

  void read() async {
    print('read: $read');
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('UserId');
      globals.apiKey = prefs.getString('API_KEY');
      print("api_key=======${globals.apiKey}");
    });
    print("read====" + userId);
    if (userId != null && userId.isNotEmpty) {
      globals.userId = int.parse(userId);
      // getUserDetails();
      // getTemperatureValue();
    } else {
      globals.userId = 0;
    }
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("UserId");
    prefs.remove("UserName");
    prefs.remove("Password");
    prefs.remove("FirstName");
    prefs.remove("LastName");
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
}
