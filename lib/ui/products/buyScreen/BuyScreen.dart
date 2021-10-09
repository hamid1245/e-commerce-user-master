import 'package:e_commerc/navigator/navigatorHelperPush.dart';
import 'package:e_commerc/ui/payment/paymentScreen.dart';
import 'package:e_commerc/ui/products/buyScreen/dileveryLocation.dart';
import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/buttons/customColorButton.dart';
import 'package:e_commerc/widgets/customAppBar.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context,
          text: 'Confirm order',
          textSize: 14,
          fontWeight: FontWeight.w600,
          textColor: Colors.grey,
          onPressed: () {},
          elevation: 0,
          backicon: Icons.arrow_back_ios, appBarColor: Colors.white),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                    child: Image.asset(Res.shoes2),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'Jarger-LeCoulter',
                          textSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.black),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                          text: 'Jarger-LeCoultersad asd asd asd ad ',
                          textSize: 14,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.grey),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              // onTap: NavigationHelperPush.pushRoute(context, DileveryLocation()),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Color(0xff5079D8).withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: 'Dilivery Loacation',
                                    textSize: 14,
                                    fontWeight: FontWeight.w500,
                                    textColor: Colors.black),
                                CustomText(
                                    text:
                                        'Chose Diliery location where you want to  place your order',
                                    textSize: 12,
                                    fontWeight: FontWeight.normal,
                                    textColor: Colors.grey),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              //onTap: NavigationHelperPush.pushRoute(context, BuyScreen()),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Color(0xff5079D8).withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: 'Payment Method',
                                    textSize: 14,
                                    fontWeight: FontWeight.w500,
                                    textColor: Colors.black),
                                CustomText(
                                    text:
                                        'Chose Payment method How you wantto  pay money',
                                    textSize: 12,
                                    fontWeight: FontWeight.normal,
                                    textColor: Colors.grey),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomText(
                text: "Order Info",
                textSize: 16,
                fontWeight: FontWeight.w500,
                textColor: Colors.black),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: 'Subtotal',
                        textSize: 17,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.grey),
                    CustomText(
                        text: '\$160.00',
                        textSize: 17,
                        fontWeight: FontWeight.normal,
                        textColor: Color(0xff434343)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: 'Shipping cost',
                        textSize: 17,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.grey),
                    CustomText(
                        text: '\$10.00',
                        textSize: 17,
                        fontWeight: FontWeight.normal,
                        textColor: Color(0xff434343)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: 'Total',
                        textSize: 17,
                        fontWeight: FontWeight.bold,
                        textColor: Colors.grey),
                    CustomText(
                        text: '\$162.00',
                        textSize: 17,
                        fontWeight: FontWeight.normal,
                        textColor: Color(0xff434343)),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            CustomColorButton(
                onPressed: () {
                  NavigationHelperPush.pushRoute(context, DileveryLocation());
                },
                label: 'Confirm order',
                width: MediaQuery.of(context).size.width,
                hight: 40,
                textSize: 12,
                textWeight: FontWeight.w500,
                textColor: Colors.white,
                buttonColor: AppContants.buttonColor)
          ],
        ),
      ),
    );
  }
}
