import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghcmobile/alert_message.dart';
import 'package:ghcmobile/model/commom_model.dart';
import 'package:ghcmobile/service/account_service.dart';

import '../styles.dart';
import 'package:ghcmobile/models/globals.dart' as globals;

class MaintenancePage extends StatefulWidget {
  @override
  MaintenanceScreen createState() => MaintenanceScreen();
}

class MaintenanceScreen extends State<MaintenancePage> {
  int currentIndex = 0;
  // TextEditingController _textDescController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String radioValue;
  String houseValue;
  String choice;
  bool _autoValidate = false;
  final addressController = TextEditingController();
  final textDescController = TextEditingController();
  final contactController = TextEditingController();
  final resetController = TextEditingController();
  String socialReg;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
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
        onWillPop: null,
        child: Stack(
          children: <Widget>[buildmain(context)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomBarButton(),
    );
  }

  Future<bool> _onBackPressed() {
    SystemNavigator.pop(); //  exit(0);
    return Future.value(false);
  }

  Widget buildmain(BuildContext context) {
    return ListView(children: [
      Container(
          width: MediaQuery.of(context).size.width / 1.05,
          padding: const EdgeInsets.all(10),
          child: Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                        'You may submit a service/maintenance request using this submission form. Please provide all requested information.  A GHC staff member will reach out to you to schedule a service call. If the matter is urgent (ex. Emergency such as electrical failure or large water leak), please call the office directly.',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: Styles.fontFamilyMedium,
                            fontSize: 13),
                        textAlign: TextAlign.left),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(right: 160),
                            child: Text('What is your address?	',
                                style: TextStyle(
                                    color: Styles.buttoncolor,
                                    fontFamily: Styles.fontFamilyBold,
                                    fontSize: 15))),
                        Padding(
                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding:
                              EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                          child: TextFormField(
                           controller: addressController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: '',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.person_outline_outlined),
                                color: Colors.grey[400],
                              ),
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
                            padding: const EdgeInsets.only(right: 120),
                            child: Text('Please describe the problem:	',
                                style: TextStyle(
                                    color: Styles.buttoncolor,
                                    fontFamily: Styles.fontFamilyBold,
                                    fontSize: 15))),
                        Padding(
                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding:
                              EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                          child: TextField(
                              controller: textDescController,
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.multiline,
                              maxLines: 8,
                              decoration: InputDecoration(
                                hintText: '',
                                filled: true,
                                // fillColor: Color(0xFFDBEDFF),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                                'How may we contact you to schedule service?',
                                style: TextStyle(
                                    color: Styles.buttoncolor,
                                    fontFamily: Styles.fontFamilyBold,
                                    fontSize: 15))),
                        Container(
                            padding: EdgeInsets.only(right: 180),
                            child: new Theme(
                              data: new ThemeData(
                                // primarySwatch: Styles.appColor,
                                unselectedWidgetColor: Colors.black,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Transform.scale(
                                      scale: 1.1,
                                      child: Radio(
                                        value: 'one',
                                        groupValue: houseValue,
                                        onChanged: mainvalueChanges,
                                      )),
                                  Text(
                                    "Email",
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
                                        onChanged: mainvalueChanges,
                                      )),
                                  Text(
                                    "Phone",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: Styles.fontFamilyMedium),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            padding: const EdgeInsets.only(right: 230),
                            child: Text('Contact Info:	',
                                style: TextStyle(
                                    color: Styles.buttoncolor,
                                    fontFamily: Styles.fontFamilyBold,
                                    fontSize: 15))),
                        Padding(
                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding:
                              EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                          child: TextFormField(
                             controller: contactController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: '',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.phone),
                                color: Colors.grey[400],
                              ),
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
                      ],
                    ),
                  )
                ],
              )))
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
                    onPressed: _mainatenance,
                    ),
              )
            ]));
  }

  void _mainatenance() {
   
    if(_formKey.currentState.validate() ){
      _formKey.currentState.save();
      AlertMessage().onLoading(context);
      Maintenance maintenance=new Maintenance();
      maintenance.userId=globals.userId;
      maintenance.address=addressController.text;
      maintenance.description=textDescController.text;
      maintenance.social=socialReg;
      maintenance.contact=contactController.text;
       print("userId=====${maintenance.userId}");
      print("address=====${maintenance.address} ");
      print("description=====${maintenance.description}");
      print("contact=====${maintenance.contact}");
    
      print("socialReg=====$socialReg");
     AccountService().userMaintenance(maintenance).then((res) => {
       if(res.status){
          Navigator.of(context).pop(),
          
          AlertMessage().showMessages(res.message),
       }else{

       }

     }).catchError((onError) {
        print(onError);
        // AlertMessage().showMessages(onError.toString());
        Navigator.pop(context);
      });
    }else{
        setState(() {
        _autoValidate = true;
      });
    }
  }

  void mainvalueChanges(String value) {
    setState(() {
      houseValue = value;
      switch (value) {
        case 'one':
          socialReg = "email";
          break;
        case 'two':
          socialReg = "phone";
          break;

        default:
          socialReg = null;
      }
      // debugPrint(genderReg); //Debug the choice in console
    });
  }
}
