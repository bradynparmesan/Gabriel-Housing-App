import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghcmobile/home/home_screen.dart';
import 'package:ghcmobile/models/commom_model.dart';
import 'package:ghcmobile/service/admin_service.dart';
import 'package:ghcmobile/styles.dart';

import '../alert_message.dart';

class MessageScreen extends StatefulWidget {
  final UserMesseageList userList;

  const MessageScreen({Key key, this.userList}) : super(key: key);
  @override
  MessageScreenState createState() => MessageScreenState();
}

class MessageScreenState extends State<MessageScreen> {
  ScrollController scrollController = new ScrollController();
  Future<List<UserMesseageList>> _listUsers;
  bool checkboxValue = false;
  int currentIndex = 0;
  bool isCheked = false;
  String userId;
  int scrollCount = 0;

  List<UserMesseageList> user = new List<UserMesseageList>();
  @override
  void initState() {
    super.initState();
    // controller.addListener(_onTextChanged);
    //read();
    _listUsers = getList(count: 1);
  }

  @override
  void dispose() {
    //focusNode.dispose();
    super.dispose();
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
          child: FutureBuilder<List<UserMesseageList>>(
            future: _listUsers,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: AlertMessage().buildProgressIndicator());
              return messagePage(snapshot.data);
            },
          )),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: buildBottomBarButton(),
    );
  }

  Widget messagePage(List<UserMesseageList> user) {
    return Container(
      child: user.length > 0
          ? ListView.builder(
              controller: scrollController,
              itemCount: user.length,
              itemBuilder: (BuildContext context, int index) {
                var userId = user[index].toId;

                return Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListTile(
                      selected: isCheked,
                      // leading: CircleAvatar(
                      //   backgroundImage: url != null && url != ""
                      //       ? NetworkImage(url)
                      //       : user[index].type == "user"
                      //           ? AssetImage("assets/img/user1.png")
                      //           : AssetImage("assets/img/group.png"),
                      //   radius: 25,
                      //   backgroundColor: Colors.white,
                      // ),
                      title: Text(
                        Styles.capitalize(user[index].message),
                        style: Styles.headerText,
                      ),
                      trailing: RaisedButton(
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Styles.fontFamilyBold,
                              fontSize: 18,
                            ),
                          ),
                          color: Styles.buttoncolor,

                          // color: Styles.customColor,
                          onPressed: () {
                            // block(user[index].userId, user[index].touserId,
                            //     index);
                          }),
                    ),
                  ),
                  Divider(),
                ]);
              },
            )
          : Center(
              child: Text(
              'Member not found',
              style: TextStyle(),
            )),
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
  //                   child: Text(
  //                     "DELETE",
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontFamily: Styles.fontFamilyBold,
  //                       fontSize: 18,
  //                     ),
  //                   ),
  //                   color: Styles.buttoncolor,
  //                   shape: new RoundedRectangleBorder(
  //                     borderRadius: new BorderRadius.circular(5.0),
  //                   ),
  //                   onPressed: () {
  //                     // int index;

  //                     // setState(() {
  //                     //   userMessageDelete(user[index].userId, index);
  //                     // });
  //                   }),
  //             )
  //           ]));
  // }

  Future<List<UserMesseageList>> getList(
      {int count = 1, String query = ""}) async {
    List<UserMesseageList> result =
        await AdminService().fetchUserMessageList(count: count, query: query);

    print(" message ");
    print(result);
    setState(() {
      user = result;
      scrollCount = 1;
    });
    return user;
  }

  userMessageDelete(int userId, int index) {
    AdminService().messageDelete(userId).then((res) {
      if (res.status) {
        setState(() {
          user.removeAt(index);
        });
      }
      print(res);
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<bool> _onBackPressed() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    return Future.value(true);
  }
}
