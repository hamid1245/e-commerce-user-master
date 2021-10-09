import 'package:e_commerc/ui/cart/cartScreen.dart';
import 'package:e_commerc/ui/intro/InfroScreen.dart';
import 'package:e_commerc/ui/notification/notificationScreen.dart';
import 'package:e_commerc/ui/payment/paymentScreen.dart';
import 'package:e_commerc/ui/products/buyScreen/dileveryLocation.dart';
import 'package:e_commerc/ui/products/favouritproducts.dart';
import 'package:e_commerc/ui/products/profile/profileScreen.dart';
import 'package:e_commerc/ui/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e-commerce',
      theme: ThemeData(

        fontFamily: "Poppins",
      ),
      home: IntroScreen(),
    );
  }
}

