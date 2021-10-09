import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc/models/faveouritModel/FavouriteModel.dart';
import 'package:e_commerc/res.dart';
import 'package:e_commerc/widgets/customAppBar.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:e_commerc/widgets/listview/customListView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouritProduct extends StatefulWidget {
  const FavouritProduct({Key? key}) : super(key: key);

  @override
  _FavouritProductState createState() => _FavouritProductState();
}

class _FavouritProductState extends State<FavouritProduct> {
  List<FavouriteModel> testList = [
    FavouriteModel(Res.shoes2, 'Nike ', '\$1500'),
    FavouriteModel(Res.shoes, 'Addidas ', '\$1200'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFav();
  }

  List<DocumentSnapshot> getfav = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context,
          text: 'Favourite',
          textSize: 16,
          fontWeight: FontWeight.w600,
          textColor: Colors.white, onPressed: () {
        Navigator.pop(context);
      },
          elevation: 0,
          backicon: Icons.arrow_back_ios,
          appBarColor: Colors.white),
      backgroundColor: Colors.white,
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('favorite').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: getfav.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: CustomListView(
                      image: getfav[i]['productImage'],
                      productTitle: getfav[i]['productName'],
                      productPrice: getfav[i]['productPrice'],
                      onPressed: () {

                        print('tapped');
                      }),
                );
              });
        });
  }

  _getFav() async {
    await FirebaseFirestore.instance
        .collection('favourite').where('uid',isEqualTo:FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        getfav.add(element);
      });
    });
  }
}
