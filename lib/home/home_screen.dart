import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  int _currentIndex = 0;
  int currentIndex = 0;
  @override
  void initState() {
    read();
    tabList.add(new Tab(
      text: 'Home',
      icon: Image.asset(
        'assets/img/03-home-gray.png',

        width: 25,
        // color: Colors.white,
      ),
    ));
    tabList.add(new Tab(
      text: 'Message',
      icon: Image.asset(
        'assets/img/05-message-gray.png',
        width: 25,
        // color: Colors.white,
      ),
    ));
    tabList.add(new Tab(
      text: 'Apply',
      icon: Image.asset(
        'assets/img/04-apply-gray.png',
        width: 25,
        // color: Colors.white,
      ),
    ));
    tabList.add(new Tab(
      text: 'About us',
      icon: Image.asset(
        'assets/img/07-about-gray.png',
        width: 25,
        // color: Colors.white,
      ),
    ));
    tabList.add(new Tab(
      text: 'Maintenance',
      icon: Image.asset(
        'assets/img/06-mainten-gray.png',
        width: 25,
        // color: Colors.white,
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
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                  icon: Image.asset(
                    'assets/img/08-menu-icon.png',
                    // width: 40,
                    // color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: null),
            ),
          ]),
      body: WillPopScope(
        onWillPop: null,
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
                buildapp(context),
                MessageScreen(),
                ApplyScreen(),
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
            labelStyle: TextStyle(fontSize: 9),
            // indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelStyle: TextStyle(fontSize: 9),
            indicatorColor: Colors.orange,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                  //  topLeft: Radius.circular(10),
                  //  topRight: Radius.circular(5)
                  ),
            ),
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
    SystemNavigator.pop(); //  exit(0);
    return Future.value(false);
  }

  // Widget buildTabbar(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //           backgroundColor: Colors.white,
  //           leading: BackButton(color: Colors.black),
  //           elevation: 0,
  //           automaticallyImplyLeading: false,
  //           actions: [
  //             Padding(
  //               padding: EdgeInsets.only(right: 10),
  //               child: IconButton(
  //                   icon: Icon(
  //                     Icons.dashboard_outlined,
  //                     color: Colors.black,
  //                   ),
  //                   iconSize: 40,
  //                   onPressed: null),
  //             ),
  //           ]),
  //       body: buildapp(context));
  // }

  Widget buildapp(BuildContext context) {
    return ListView(
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
                          borderRadius: BorderRadius.circular(28),
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
                            //color:Colors.white,
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => ApplyScreen()));
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
                          borderRadius: BorderRadius.circular(28),
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
                              await Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => MessageScreen()));
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
                          borderRadius: BorderRadius.circular(28),
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
                              await Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => MaintenancePage()));
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
                          borderRadius: BorderRadius.circular(28),
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
                              await Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => AboutPage()));
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
    );
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
}
