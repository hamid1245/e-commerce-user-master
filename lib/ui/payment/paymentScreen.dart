import 'package:e_commerc/widgets/customAppBar.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context,
          text: 'text',
          textSize: 12,
          fontWeight: FontWeight.normal,
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          elevation: 0,
          backicon: Icons.arrow_back_ios, appBarColor: Colors.white),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            CustomText(
                text: 'Payment',
                textSize: 30,
                fontWeight: FontWeight.w600,
                textColor: Color(0xff434343)),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(12)),
            ),
            SizedBox(
              height: 50,
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
                        text: 'Discount',
                        textSize: 17,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.grey),
                    CustomText(
                        text: '5%',
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
                        text: 'Shipping',
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
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.3))),
                ),
                SizedBox(
                  height: 10,
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
            )
          ],
        ),
      ),
    );
  }
}
