/*
#ffffff  // left sidebar color
#f1f1ef // main bg color
#2f293e // seaher bar color
#1b254b // right  sidebar color 
#111c44 // main center two cards color
#c13750 // selected element color of all projets cards
#7551fc // rating color in top creators 
#3c354a // right sidebar cards colors
#b070ee // button color of right sidevbar cars 
#4923cb // cards gradient color first 
#a164b8 // cards gradient colors second 
#f9afae // cards gradient colors third   
#b5b5b5 // grey 
#000000 // black 
line one #4a3ba1
line two #ce8e97
calender btn #340cf7
card btn #bf86f6
rating #7853fc
*/

import 'package:flutter/material.dart';

class AppColors {
  static const String mainBg = "0xfff1f1ef";
  static const String leftSideBarBg = "0xffffffff";
  static const String searchCardBg = "0xff2f293e";
  static const String rightSideBarBg = "0xff1b254b";
  static const String black = "0xff000000";
  static const String skyBlue = "0xffe3e9fe";
  static const String gradientRightColor = "0xff4923cb";
  static const String gradientLeftColor = "0xfff9afae";
  static const String gradientMidColor = "0xfffa164b8";
  static const String gradientCardBtnColor = "0xff261b4c";
  static const String centerCardColor = "0xff111c44";
  static const String cCSelectedItemColor = "0xffc13750";
  static const String rightSideCardColor = "0xff3c354a";
  static const String lineOneColor = "0xff4a3ba1";
  static const String lineTwoColor = "0xffce8e97";
  static const String calEleColor = "0xff340cf7";
  static const String cardBtnColor = "0xffbf86f6";
  static const String ratingColor = "0xff7853fc";

  Color getColor(String clr) {
    return Color(int.parse(clr));
  }
}
