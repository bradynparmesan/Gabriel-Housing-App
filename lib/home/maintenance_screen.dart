import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghcmobile/alert_message.dart';
import 'package:ghcmobile/home/home_screen.dart';
import 'package:ghcmobile/main/validator.dart';
import 'package:ghcmobile/model/commom_model.dart';
import 'package:ghcmobile/models/commom_model.dart';
import 'package:ghcmobile/service/account_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles.dart';
import 'package:ghcmobile/models/globals.dart' as globals;
import 'dart:io' as Io;
import 'dart:convert';

class MaintenancePage extends StatefulWidget {
  @override
  MaintenanceScreen createState() => MaintenanceScreen();
}

class MaintenanceScreen extends State<MaintenancePage> {
  int currentIndex = 2;
  String userId;
  // TextEditingController _textDescController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String radioValue;
  String houseValue = "one";
  String choice;
  bool _autoValidate = false;
  final addressController = TextEditingController();
  final textDescController = TextEditingController();
  final contactController = TextEditingController();
  final resetController = TextEditingController();
  String socialReg="email";
  //var imageWidget = Image.memory(bytes);
  String imageB64;
  File _image;
  String phoneNumber;

  // @override
  // void initState() {
  //   setState(() {
  //     houseValue = "one";
  //   });
  //   super.initState();
  // }

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
          children: <Widget>[buildmain(context)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomBarButton(),
    );
  }

  Future<bool> _onBackPressed() {
    print("object===");
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));

    return Future.value(true);
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
                            //padding: const EdgeInsets.only(right: 160),
                            width: MediaQuery.of(context).size.width / 1.22,
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
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Styles.buttoncolor, width: 1),
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
                            validator: Validator.validateAddress,
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
                            // padding: const EdgeInsets.only(right: 120),
                            width: MediaQuery.of(context).size.width / 1.22,
                            child: Text('Please describe the problem:	',
                                style: TextStyle(
                                    color: Styles.buttoncolor,
                                    fontFamily: Styles.fontFamilyBold,
                                    fontSize: 15))),
                        Padding(
                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding:
                              EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                          child: TextFormField(
                            controller: textDescController,
                            textInputAction: TextInputAction.newline,
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
                                borderSide: BorderSide(
                                    color: Styles.buttoncolor, width: 1),
                              ),
                            ),
                            validator: Validator.describeProblem,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.22,
                          //padding: const EdgeInsets.only(right: 50),
                          child: Text('Please provide a photo of the problem:',
                              style: TextStyle(
                                  color: Styles.buttoncolor,
                                  fontFamily: Styles.fontFamilyBold,
                                  fontSize: 15)),
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 20),
                                Container(
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 250,
                                          child: Center(
                                              child: _image == null
                                                  ? Text('No image selected.')
                                                  : Container(
                                                      // width: 100.00,
                                                      // height: 100.00,
                                                      // decoration:
                                                      //     new BoxDecoration(
                                                      //   image:
                                                      //       new DecorationImage(
                                                      //     image: ExactAssetImage(
                                                      //         'Image.file(_image)'),
                                                      //     fit: BoxFit.fitHeight,
                                                      //   ),
                                                      // )
                                                      child: Row(children: [
                                                      Container(
                                                        height: 100.0,
                                                        width: 100.0,
                                                        decoration:
                                                            new BoxDecoration(
                                                          shape: BoxShape
                                                              .rectangle,

                                                          // border: Border.all(
                                                          //     color: const Color(
                                                          //         0x33A6A6A6)),
                                                          // image: new Image.asset(_image.)
                                                        ),
                                                        child: new Image.file(
                                                          _image,
                                                          width: 100.0,
                                                          height: 100,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: FlatButton(
                                                          child: Text('Remove',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily: Styles
                                                                      .fontFamilyBold,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          color: Styles
                                                              .buttoncolor,
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    5.0),
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              _image = null;
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    ]))),
                                        )
                                      ],
                                    )),
                                //width: 10,
                                // child: Row(
                                //   children: [
                                //     Image.file(_image),
                                //     SizedBox(width:2),
                                //     Container(

                                //       width: 100,
                                //       height: 30,
                                //       child: FlatButton(
                                //         child: Text('Remove',
                                //             style: TextStyle(
                                //                 color:
                                //                     Colors.white,
                                //                 fontFamily: Styles
                                //                     .fontFamilyBold,
                                //                 fontSize: 15,
                                //                 fontWeight:
                                //                     FontWeight
                                //                         .bold)),
                                //         color: Styles.buttoncolor,
                                //         shape:
                                //             new RoundedRectangleBorder(
                                //           borderRadius:
                                //               new BorderRadius
                                //                   .circular(5.0),
                                //         ),
                                //         onPressed: () {
                                //           setState(() {
                                //             _image = null;
                                //           });
                                //         },
                                //       ),
                                //     )
                                //   ],
                                // ),

                                Container(
                                    child: IconButton(
                                  icon: Icon(
                                    Icons.attach_file,
                                    color: Colors.black,
                                  ),
                                  iconSize: 35,
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              title: Container(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: IconButton(
                                                          icon: Icon(Icons
                                                              .add_a_photo),
                                                          color: Colors.black,
                                                          iconSize: 25,
                                                          onPressed: null,
                                                        ),
                                                      ),
                                                      FlatButton(
                                                        child: Text('Gallery',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily: Styles
                                                                    .fontFamilyMedium,
                                                                fontSize: 20)),
                                                        onPressed: () {
                                                          getGallery();
                                                        },
                                                      )
                                                    ],
                                                  )),
                                              content: Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: IconButton(
                                                      icon: Icon(Icons.camera),
                                                      color: Colors.black,
                                                      iconSize: 25,
                                                      onPressed: null,
                                                    ),
                                                  ),
                                                  FlatButton(
                                                    child: Text('Camera',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily: Styles
                                                                .fontFamilyMedium,
                                                            fontSize: 20)),
                                                    onPressed: () {
                                                      getCamera();
                                                    },
                                                  )
                                                ],
                                              )));
                                        });
                                  },
                                )),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.22,
                            // padding: const EdgeInsets.only(right: 20),
                            child: Text(
                                'How may we contact you to schedule service?',
                                style: TextStyle(
                                    color: Styles.buttoncolor,
                                    fontFamily: Styles.fontFamilyBold,
                                    fontSize: 15))),
                        Container(
                            padding: EdgeInsets.only(right: 150),
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
                                        fontSize: 12,
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
                                        fontSize: 12,
                                        fontFamily: Styles.fontFamilyMedium),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.22,
                            // padding: const EdgeInsets.only(right: 230),
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
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Styles.buttoncolor, width: 1),
                              ),
                              hintText: '',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: houseValue == "one"
                                    ? Icon(Icons.mail)
                                    : Icon(Icons.phone),
                                color: Colors.grey[400],
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontFamily: Styles.fontFamilyMedium,
                              ),
                            ),
                            validator: houseValue == "one"
                                ? Validator.validateEmail
                                : Validator.validateMobile,
                            // onSaved: (String val) {
                            //   phoneNumber = val;
                            // },
                            autovalidate: _autoValidate,
                            onChanged: (String val) {
                              setState(() {
                                _autoValidate = true;
                                phoneNumber = val;
                              });
                              print("val $val");
                            },
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
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AlertMessage().onLoading(context);
      Maintenance maintenance = new Maintenance();
      maintenance.userId = globals.userId;
      maintenance.address = addressController.text;
      maintenance.description = textDescController.text;
      maintenance.socialtype = socialReg;
      maintenance.contact = contactController.text;
      maintenance.problemofphoto = imageB64;
      print("userId=====${maintenance.userId}");
      print("address=====${maintenance.address} ");
      print("description=====${maintenance.description}");
      print("contact=====${maintenance.contact}");

      print("socialReg=====$socialReg");
      print("imageB64=====$maintenance.problemofphoto");
      AccountService()
          .userMaintenance(_image, maintenance)
          .then((res) => {
                if (res.status)
                  {
                    Navigator.of(context).pop(),
                    AlertMessage().showMessages(res.message),
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => HomePage()))
                  }
                else
                  {Navigator.of(context).pop()}
              })
          .catchError((onError) {
        print(onError);
        // AlertMessage().showMessages(onError.toString());
        Navigator.pop(context);
      });
    } else {
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

      // debugPrint(socialReg); //Debug the choice in console
    });
  }

  Future getGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    // if (image != null) {
      setState(() {
        _image = image;

        // List<int> imageBytes = _image.readAsBytesSync();
        // imageB64 = base64Encode(imageBytes);
        print("_image=====$imageB64");
      });
   // }
    Navigator.pop(context);
  }

  Future getCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      // List<int> imageBytes = _image.readAsBytesSync();
      // imageB64 = base64Encode(imageBytes);
      print("_image=====$imageB64");
    });
    Navigator.pop(context);
  }
  //  Future _getFromCamera() async {
  //   PickedFile pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //        _image = File(pickedFile.path);
  //        List<int> imageBytes = _image.readAsBytesSync();
  //     imageB64 = base64Encode(imageBytes);
  //     print("imageB64=====$imageB64");
  //     });
  //   }
  // }
}
