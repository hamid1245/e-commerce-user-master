import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc/navigator/navigatorHelperReplace.dart';
import 'package:e_commerc/res.dart';
import 'package:e_commerc/ui/auth/loginScreen.dart';
import 'package:e_commerc/widgets/buttons/customBorderColor.dart';
import 'package:e_commerc/widgets/customAppBar.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:e_commerc/widgets/profile/customProfileContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final User _user;
  String name = '';
  String email = '';
  String password = '';
  bool isLoading = true;

  void initState() {
    super.initState();
    _getCurrentUserData();
  }

  late StreamSubscription _subscription;

  _getCurrentUserData() async {
    String docID = (await FirebaseAuth.instance.currentUser!).uid;
    _subscription = FirebaseFirestore.instance
        .collection("users")
        .doc(docID)
        .snapshots()
        .listen((DocumentSnapshot snapshot) {
      name = snapshot["first_name"];
      email = snapshot['email'];
      password = snapshot["password"];

      setState(() {
        print("MY EMAIL is $email");
        isLoading = false;
      });
    });
  }

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    setState(() {
      _subscription.cancel();
    });
  }


  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);


  late QuerySnapshot querySnapshot;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context,
          text: '',
          textSize: 18,
          fontWeight: FontWeight.w600,
          textColor: Colors.white, onPressed: () {
        Navigator.pop(context);
      },
          elevation: 0,
          backicon: Icons.arrow_back_ios,
          appBarColor: Colors.white),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 0.80))
              ],
            ),
            child: InkWell(
              onTap: () {
                 // _user.photoURL;
                _showPicker(context);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.asset(
                // _googleSignIn.currentUser!.photoUrl.toString(),
               Res.avatar
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: 'Email',
                  textSize: 14,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.grey),
              CustomProfileContainer(text: email),
              SizedBox(
                height: 20,
              ),
              CustomText(
                  text: 'Password',
                  textSize: 14,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.grey),
              CustomProfileContainer(text: password),
              SizedBox(
                height: 20,
              ),
              CustomText(
                  text: 'Name ',
                  textSize: 14,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.grey),
              CustomProfileContainer(text: name),
              SizedBox(
                height: 20,
              ),
              // CustomText(
              //      text: 'Last name',
              //      textSize: 14,
              //      fontWeight: FontWeight.w600,
              //      textColor: Colors.grey),
              //  CustomProfileContainer(text: 'Smith'),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: CustomBorderColor(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      NavigationHelperReplace.replaceRoute(
                          context, LoginScreen());
                      Fluttertoast.showToast(
                          msg: 'Logout SuccessFully',
                          backgroundColor: Colors.white,
                          textColor: Colors.black);
                      // NavigationHelperPush.pushRoute(context, LoginScreen());
                    },
                    label: 'Sign out',
                    width: 12,
                    hight: 40,
                    textSize: 14,
                    textWeight: FontWeight.w500,
                    textColor: Colors.black,
                    buttonColor: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  _imgFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }


}
