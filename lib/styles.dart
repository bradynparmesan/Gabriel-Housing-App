import 'package:flutter/material.dart';
  
abstract class Styles {
  static const MaterialColor appColor = const MaterialColor(
    0xFFC65302,
    const <int, Color>{
      50: const Color(0xFF0918ea),
      100: const Color(0xFF0918ea),
      200: const Color(0xFF0918ea),
      300: const Color(0xFF0918ea),
      400: const Color(0xFF0918ea),
      500: const Color(0xFF0918ea),
      600: const Color(0xFF0918ea),
      700: const Color(0xFF0918ea),
      800: const Color(0xFF0918ea),
      900: const Color(0xFF0918ea),
    },
  );
   static TextStyle headerText = new TextStyle(
    fontSize: 15.0,
    // fontFamily: fontFamilyBold,
    // color: dapcolor,
  );
    static TextStyle subheaderText = new TextStyle(
    fontSize: 13.0,
    // fontFamily: fontFamilyMedium,
    // color: black,
  );
  //Lending & login & accout create color
   static const Color buttoncolor = Color(0xFF0918ea);
  static const Color lendingtxtcolor = Color(0xFF0918ea);
   static String capitalize(String str) {
    //return str[0].toUpperCase() + str.substring(1);
  return str.trim().substring(0, 1).toUpperCase() +str.substring(1);
   // print(str);
    // return  str.trim().toLowerCase().split(' ').map((word) {
    //  // String splitText=word;
    //     String leftText =
    //         (word.length > 1) ? word.substring(1, word.length) : "";
    //         // print("============"+word);
    //          // print("=======leftText====="+leftText);
    //     return word[0].toUpperCase() + leftText;//:str[0].toUpperCase() + str.substring(1);;
    //   }).join(' ');
  }

 //home color
   static const Color navcolor = Color(0xFFa4a5ba);
   
  static const String fontFamilyBold = "Roboto Bold";
  static const String fontFamilyRegular = "Roboto Regular";
  static const String fontFamilyLight = "Roboto Light";
  static const String fontFamilyMedium = "Roboto Medium";
}
