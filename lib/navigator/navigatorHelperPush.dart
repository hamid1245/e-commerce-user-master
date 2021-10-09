import 'package:flutter/material.dart';

class NavigationHelperPush{
  static pushRoute(BuildContext context, Widget targetClass){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>targetClass));
  }
}