import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryCustomClass extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productRating;
  final String productImage;
  final VoidCallback onFavPress;
  const CategoryCustomClass(
      {
      required this.productName,
      required this.productPrice,
      required this.productRating,
      required this.productImage, required this.onFavPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffFFFFFF),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withAlpha(30),
              blurRadius: 10.0,
              offset: Offset(0, 5))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: ()=>onFavPress(),
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
              )),
          Center(
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset(productImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CustomText(
                text: productName,
                textSize: 14,
                fontWeight: FontWeight.w600,
                textColor: AppContants.lightGreyColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: productPrice,
                    textSize: 12,
                    fontWeight: FontWeight.normal,
                    textColor: AppContants.lightGreyColor),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: 15,
                        width: 15,
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CustomText(
                        text: productRating,
                        textSize: 12,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.black)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
