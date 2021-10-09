import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/buttons/customBorderColor.dart';
import 'package:e_commerc/widgets/customAppBar.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../res.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<DocumentSnapshot> cartData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context,
          text: 'My Cart',
          textSize: 14,
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
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('cart').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: cartData.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: AppContants.appShadow,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                                height: 100,
                                width: 100,
                                child:
                                    Image.asset(cartData[i]['productImage'])),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: cartData[i]['productName'],
                                  textSize: 18,
                                  fontWeight: FontWeight.w500,
                                  textColor: Colors.black),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                  text: cartData[i]['productName'],
                                  textSize: 14,
                                  fontWeight: FontWeight.normal,
                                  textColor: Colors.grey),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _deleteCart(
                                          snapshot.requireData.docs[i].id);
                                    },
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: CustomBorderColor(
                                        onPressed: () {},
                                        label: 'buy',
                                        width: 12,
                                        hight: 18,
                                        textSize: 12,
                                        textWeight: FontWeight.normal,
                                        textColor: Colors.black,
                                        buttonColor: Colors.white),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }

  _getCart() async {
    await FirebaseFirestore.instance
        .collection('cart')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        cartData.add(element);
      });
    });
  }

  _deleteCart(String docID) async {
    await FirebaseFirestore.instance
        .collection('cart')
        .doc(docID)
        .delete()
        .whenComplete(() {
      Fluttertoast.showToast(msg: 'Deleted successFully');
    });
  }
}
