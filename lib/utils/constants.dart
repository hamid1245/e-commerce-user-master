import 'package:flutter/material.dart';

class AppContants {
  static const Color appBaseColor = Color(0xff5079D8);
  static const Color buttonColor = appBaseColor;
  static var containerGradientColor = LinearGradient(
    end: const Alignment(0.0, 0.6),
    begin: const Alignment(0.0, -1),
    colors: [
      Color(0xff4D75D1),
      Color(0xff283D6C),
    ],
  );
  static var homeContainer = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [

      Color(0xffDA05B5),
      Color(0xffF59300),

    ],
  );
  static const Color appTextFieldBorderColor = Color(0xff4F4F4F);
  static const Color appTextFieldFocusedBorderColor = Color(0xff343434);
  static const Color lightGreyColor = Color(0xff707070);
  static var appShadow = <BoxShadow>[
    BoxShadow(
        color: Colors.grey.withAlpha(50),
        blurRadius: 20.0,
        offset: Offset(0, 16))
  ];


}