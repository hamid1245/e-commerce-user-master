import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc/models/productsModel/ProductsModel.dart';
import 'package:e_commerc/navigator/navigatorHelperPush.dart';
import 'package:e_commerc/res.dart';
import 'package:e_commerc/ui/products/details/ProductDetail.dart';
import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/category/categoryCustomCard.dart';
import 'package:e_commerc/widgets/customAppBar.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductsModel> testList = [
    ProductsModel(Res.shoes2, 'Nike 100s pro', '1.0', '\$1200.0'),
    ProductsModel(Res.shoes, 'Nike 10s max', '3.0', '\$1040.0'),
    ProductsModel(Res.shoes3, 'Nike news ero', '5.0', '\$1100.0'),
  ];
  List myFav = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFav();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context,
          text: 'Shoes',
          textSize: 16,
          fontWeight: FontWeight.w600,
          textColor: AppContants.lightGreyColor, onPressed: () {
        Navigator.pop(context);
      },
          elevation: 0,
          backicon: Icons.arrow_back_ios,
          appBarColor: Colors.white),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 5),
      itemCount: testList.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {
            NavigationHelperPush.pushRoute(context, ProductDetails());
          },
          child: CategoryCustomClass(
            productName: testList[i].title,
            productPrice: testList[i].price,
            productRating: testList[i].rating,
            productImage: testList[i].image,
            onFavPress: () {
              _addFavourite(
                  testList[i].image, testList[i].title, testList[i].price);
            },
          ),
        );
      },
    );
  }

  _addFavourite(
    String image,
    String name,
    String Price,
  ) async {
    print("Product Name $name");
    try {
      bool isAvailable = false;
      for (int i = 0; i < myFav.length; i++) {
        if (myFav[i]['productName'].toString().toLowerCase().trim() ==
            name.toLowerCase().trim()) {
          isAvailable = true;
          setState(() {});
        }
      }
      if (isAvailable) {
        Fluttertoast.showToast(msg: 'Already exist ');
      } else {
        await FirebaseFirestore.instance.collection('favourite').doc().set({
          'productImage': image,
          'productName': name,
          'productPrice': Price,
          'uid': FirebaseAuth.instance.currentUser!.uid
        }).whenComplete(
            () => Fluttertoast.showToast(msg: 'product added SuccessFully'));
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: 'message${e.message}');
    }
  }

  getFav() {
    FirebaseFirestore.instance
        .collection('favourite')
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((value) {
      value.docs.forEach((element) {
        myFav.add(element);
        setState(() {});
      });
      print("ddd" + myFav[0]['productName'].toString());
    });
  }
}
