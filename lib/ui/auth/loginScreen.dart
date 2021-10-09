import 'package:e_commerc/navigator/navigatorHelperPush.dart';
import 'package:e_commerc/navigator/navigatorHelperReplace.dart';
import 'package:e_commerc/res.dart';
import 'package:e_commerc/ui/auth/signUpScreen.dart';
import 'package:e_commerc/ui/homeScreen.dart';
import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/AuthButton.dart';
import 'package:e_commerc/widgets/AuthTextField.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:e_commerc/widgets/socialMedia/socialMediaButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  bool isloged = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                Res.background,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110.0, left: 30),
                    child: CustomText(
                        text: "Login",
                        textSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.black),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  AuthTextField(
                    label: "Email",
                    validator: (val) =>
                        val.isEmpty ? "Kindly provide your Email." : null,
                    controller: _email,
                    hint: "Enter your email",
                    padding: 30,
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  AuthTextField(
                    label: "Password",
                    validator: (val) =>
                        val.isEmpty ? "Kindly provide your Password." : null,
                    controller: _password,
                    hint: "Enter your password",
                    padding: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30, top: 10),
                        child: CustomText(
                            text: "Forgot your password?",
                            textSize: 10,
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black),
                      )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 30, right: 30),
                          child: AuthButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                return _userLogin();
                              }
                            },
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: 'Don\'t have an Account?',
                          textSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: AppContants.lightGreyColor),
                      InkWell(
                        onTap: () {
                          NavigationHelperPush.pushRoute(
                              context, SignUpScreen());
                        },
                        child: CustomText(
                            text: "Sign Up",
                            textSize: 12,
                            fontWeight: FontWeight.bold,
                            textColor: Color(0xff06132E)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: 100,
                        color: AppContants.lightGreyColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Text("OR"),
                      ),
                      Container(
                        height: 1,
                        width: 100,
                        color: AppContants.lightGreyColor,
                      ),
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
                      SizedBox(
                        width: 10,
                      ),
                      SoicalMediaButton(
                          socialImage: Res.facebook, onPress: () {}),
                      SizedBox(
                        width: 10,
                      ),
                      SoicalMediaButton(
                          socialImage: Res.google,
                          onPress: () {
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

  _userLogin() async {
    makeLoadingTrue();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text)
          .whenComplete(() => makeLoadingFalse())
          .then((value) {
        Fluttertoast.showToast(msg: 'Login successfully');
        NavigationHelperPush.pushRoute(context, HomeScreen());
      });
    } on FirebaseAuthException catch (e) {
      makeLoadingFalse();
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Column(
                children: [
                  Text(
                    'Alert!',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.redAccent,
                    thickness: 2,
                  ),
                ],
              ),
              content: Text(e.message.toString()),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancle',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ),
              ],
            );
          });
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
      await _googleSignIn.signIn().whenComplete(() {
        NavigationHelperReplace.replaceRoute(context, HomeScreen());
        Fluttertoast.showToast(msg: 'google  Login SuccessFully');
      });

      setState(() {
        isloged = true;
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }
}
