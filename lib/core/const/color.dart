import 'dart:ui';

import 'package:flutter/material.dart';

var BlueLight = const Color.fromRGBO(0, 129, 167, 1); //آبی تیره
var YellowWithe = const Color.fromARGB(217, 217, 217, 1).withOpacity(0.1); //اجری
var Brwon=   Colors.grey; //قهوه ای روشن

TextStyle SizeButton = const TextStyle(
    color: Colors.white,
    fontFamily: "IRANSANCE",
    fontSize: 18,
  );

class ColorConst {
  static const primaryColor = Color(0xFF685BFF);
  static const canvasColor = Color(0xFF2E2E48);
  static const scaffoldBackgroundColor = Color(0xFF464667);
  static const accentCanvasColor = Color(0xFF3E3E61);
  static const white = Colors.white;
  static const actionColor =  Color(0xFF5F5FA7);
  static const divider = Divider(color: white, height: 1);
  static const kPrimaryColor = Color(0xFF6F35A5);
  static const kPrimaryLightColor = Color(0xFFF1E6FF);

  static double defaultPadding = 16.0;

// ignore: non_constant_identifier_names
  static const NavyBlue = const Color.fromRGBO(33, 99, 134, 1); //آبی روشن
// ignore: non_constant_identifier_names
  static const LightGray = const Color.fromRGBO(247, 247, 248, 1.0); //خاکستری روشن

  static const Color scaffoldDark = Color(0xff222736);
  static const Color cardDark = Color(0xff2a3142);
  static const Color cardLight = Color(0xFFf2f2f5);
  static const Color drawerIcon = Color(0xFF8699AD);
  static const Color primary = Color(0xFF417afe);
  static const Color primaryDark = Color.fromARGB(255, 54, 64, 152);
  static const Color appbarLightBG = Color(0xFFE9E9EF);
  static const Color drawerBG = Color(0xFFE9F0F9);
  static const Color drawerTextColor = Color(0xFFA8C2D8);
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF000000);
  static const Color white12 = Color(0x1FFFFFFF);
  static const Color grey800 = Color(0xFF424242);
  static const Color blue = Color(0xFF2196F3);
  static const Color teal = Color(0xFF02A499);
  static const Color lightFontColor = Color(0xFF5B626B);
  static const Color darkFontColor = Color(0xFFE9ECEF);
  static const Color drawerHover = Color(0xFFD4D9DE);
  static const Color backgroundColor = Color(0xFFccedeb);
  static const Color borderColor = Color(0xFFb3e4e0);
  static const Color textColor = Color(0XFF5B626B);
  static const Color footerLight = Color(0xffE9EEF9);
  static const Color footerDark = Color(0xff2e3344);

  static const Color darkModeBackGround = Color.fromRGBO(34, 39, 53, 1);

//form upload file
  static const Color file = Color(0xffdddddd);

//wizard form
  static const Color stepperBackGround = Color(0xffdaddf5);

// authentication
  static const Color darkContainer = Color(0xff323a4e);
  static const Color darkFooterText = Color(0xff868993);

// chat screen
  static const Color sendButtonColor = Color(0xFF02a499);
  static const Color lightGrey = Color(0xFFdee2e6);

  static Color get success => const Color(0xff53a653);

  static Color get warning => const Color(0xffffcc00);

  static Color get error => const Color(0xffe10725);

  static Color get info => const Color(0xff4fc3f7);

  static Color get dark => const Color(0xFF343A40);

  static Color get successDark => const Color(0xff408140);

  static Color get warningDark => const Color(0xffffb800);

  static Color get errorDark => const Color(0xffc7051b);

  static Color get infoDark => const Color(0xff03a9f4);

//table hover color
  static const Color tableHover = Color(0xFFf8f9fa);

  static Color get darkGreen => const Color(0xff02a499);

  static Color get darkGreen2 => const Color(0xff01625c);

//sale report
  static const Color chartColorBlue = Color(0xff616fd4);
  static const Color chartColorGreen = Color(0xff37a499);
  static const Color chartColorYellow = Color(0xfff8b427);

//monthly earning
  static const Color chartBorderColor = Color(0xff6d6fb9);
  static const Color chartForgoundColor = Color(0xff8BB4DD);

//chart Colors
  static Color get blueChartColor => const Color(0xff3c4bcf);

  static Color get gridChartColor => const Color(0xffe9ebef);

  static Color get gridTextColor => const Color(0xff7589a2);

  static Color get greyChartColor => const Color(0xffcccccc);

//calendar
  static const Color calDarkBorder = Color(0xFF454D66);
  static const Color callighBorder = Color(0xFFE9ECEF);
  static const Color calSuccess = Color(0xFF02A499);

  static const Color footerDownColor = Color.fromRGBO(17, 23, 35, 1);
  static const Color footerUpColor = Color.fromRGBO(13, 17, 27, 1);
  static const Color footerButtonRed = Color.fromRGBO(101, 3, 20, 1);

//e-commerce
  static const Color priceColor = Color(0xff6f0d22);
  static const Color lightRed = Color(0xffEF486A);
  static const Color lightBlue = Color(0xff25BCF1);
  static Color grey200 = Colors.grey.shade200;


  static const Snakcolor = TextStyle(
    fontSize: 15 ,
    fontWeight: FontWeight.bold,
    color: NavyBlue,
    fontFamily: "YKB",);
}


class FxColor {
  static Color get success => const Color(0xff53a653);
  static Color get warning => const Color(0xffffcc00);
  static Color get error => const Color(0xffe10725);
  static Color get info => const Color(0xff4fc3f7);

  static Color get successDark => const Color(0xff408140);
  static Color get warningDark => const Color(0xffffb800);
  static Color get errorDark => const Color(0xffc7051b);
  static Color get infoDark => const Color(0xff03a9f4);

  static const Color white = Color(0xffffffff);
  static Color get dark => const Color(0xff141414);

  // facebook color
  static const Color facebook = Color(0xff29b0fc);
  static const Color facebookDark = Color(0xff1067dd);

  // whatsapp color
  static const Color whatsApp = Color(0xff25d366);
  static const Color whatsAppDark = Color(0xff075e54);

  // apple color
  static const Color appleLight = Color(0xFFffffff);
  static const Color appleDark = Color(0xFF000000);
}