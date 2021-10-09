import 'package:e_commerc/navigator/navigatorHelperPush.dart';
import 'package:e_commerc/ui/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class backendService {
  static login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        Fluttertoast.showToast(msg: 'login SuccessFull')
            .then((value) => Get.to(HomeScreen()));
        print('helllloooldhlksdfljdflksjl');
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: 'message${e.message}');
    }
  }
}
