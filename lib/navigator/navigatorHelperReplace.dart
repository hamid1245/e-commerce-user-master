import 'package:flutter/material.dart';

class NavigationHelperReplace{
  static replaceRoute(BuildContext context, Widget targetClass){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>targetClass));
  }
}