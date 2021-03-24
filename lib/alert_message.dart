import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertMessage {
  Future<void> showMessage(BuildContext context, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //  title: Text('Not in stock'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Ok',
                // style: TextStyle(
                //  color: Styles.customColor, fontSize: globals.fontSize),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  onpopup(BuildContext context) {}

  Widget buildProgressIndicator({bool submit = false}) {
    return new Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  void onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    // new Future.delayed(new Duration(minutes: 1), () {
    //   Navigator.pop(context); //pop dialog
    // });
  }

  void showMessages(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        // duration: Duration(seconds: 2),

        // timeInSecForIosWeb:,

        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
