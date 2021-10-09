import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc/navigator/navigatorHelperPush.dart';
import 'package:e_commerc/navigator/navigatorHelperReplace.dart';
import 'package:e_commerc/res.dart';
import 'package:e_commerc/ui/auth/loginScreen.dart';
import 'package:e_commerc/ui/homeScreen.dart';
import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/AuthButton.dart';
import 'package:e_commerc/widgets/AuthTextField.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:e_commerc/widgets/socialMedia/socialMediaButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
class SignUpScreen extends StatefulWidget {


  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth=FirebaseAuth.instance;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isloading=false;
  bool isloged=false;
  GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return LoadingOverlayPro(
      isLoading: isloading,
      child: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Image.asset(Res.background, fit: BoxFit.cover,),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110.0, left: 30),
                    child: CustomText(
                        text: "Signup",
                        textSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.black),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  AuthTextField(
                    label: "Username",
                    validator: (val) =>
                    val.isEmpty ? "Kindly provide your username." : null,
                    controller: _name,
                    hint: "Enter your username",
                    padding: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    label: "Email",
                    validator: (val) =>
                    val.isEmpty ? "Kindly provide your Email." : null,
                    controller: _email,
                    hint: "Enter your email",
                    padding: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    label: "Password",
                    validator: (val) =>
                    val.isEmpty ? "Kindly provide your Password." : null,
                    controller: _password,
                    hint: "Enter your password",
                    padding: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    label: "Confirm Password",
                    validator: (val) {
                        if(val.isEmpty)
                          return 'Kindly provide your Password';
                        if(val != _password.text)
                          return 'Not Match';
                        return null;
                      // val.isEmpty ? "Kindly provide your Password." : null;
                      // if(val != _password)
                      //   return 'password not match';
                      //
                      // else {
                      //   return null;
                      // }
                    },

                    controller: _confirmPassword,
                    hint: "Enter your confirm password",
                    padding: 40,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, right: 30),
                        child: AuthButton(onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            return  _createUserAccouct();
                          }
                          // NavigationHelperReplace.replaceRoute(context, HomeScreen());

                        }),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: 'Already have an Account?',
                          textSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: AppContants.lightGreyColor),
                      CustomText(
                          text: "Sign In",
                          textSize: 12,
                          fontWeight: FontWeight.bold,
                          textColor: Color(0xff06132E))
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SoicalMediaButton(
                          socialImage: Res.instagram, onPress: () {}),
                      SizedBox(width: 10,),
                      SoicalMediaButton(
                          socialImage: Res.facebook, onPress: () {}),
                      SizedBox(width: 10,),
                      SoicalMediaButton(socialImage: Res.google, onPress: () {
                        _googleSigIn();
                      }),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _createUserAccouct() async {
    makeLoadingTrue();
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim());
      User? mUser = FirebaseAuth.instance.currentUser;
      if (mUser != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(mUser.uid)
            .set({
          "first_name": _name.text,
          'email': _email.text,
          'password': _password.text,
          'Comfirm password': _confirmPassword.text,
        }, SetOptions(merge: true)).whenComplete(() => makeLoadingFalse());
        Fluttertoast.showToast(msg: 'register successfully');
        NavigationHelperPush.pushRoute(context, LoginScreen());
      }
      setState(() {});
    } on FirebaseAuthException catch (e) {
      makeLoadingTrue();
      Fluttertoast.showToast(msg: 'wrong ${e.message}');
      print(e);
    }
  }

  makeLoadingTrue() {
    isloading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isloading = false;
    setState(() {});
  }
  _googleSigIn() async {
    try {
      _googleSignIn.signIn();
      setState(() {
        isloged=true;
      });
      Fluttertoast.showToast(msg: 'google  Login SuccessFully');
    } on FirebaseAuthException catch (e){
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }
  _googleSignOut(){
    try{
      _googleSignIn.signOut();
      setState(() {
        isloged=false;
      });
    } on FirebaseAuthException catch (e){
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }
}