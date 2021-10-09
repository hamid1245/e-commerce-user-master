import 'package:e_commerc/navigator/navigatorHelperPush.dart';
import 'package:e_commerc/res.dart';
import 'package:e_commerc/ui/payment/paymentScreen.dart';
import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/buttons/customBorderColor.dart';
import 'package:e_commerc/widgets/customAppBar.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:e_commerc/widgets/profile/customProfileContainer.dart';
import 'package:flutter/material.dart';

class DileveryLocation extends StatefulWidget {
  const DileveryLocation({Key? key}) : super(key: key);

  @override
  _DileveryLocationState createState() => _DileveryLocationState();
}

class _DileveryLocationState extends State<DileveryLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context,
          text: 'Dilevery Location',
          textSize: 14,
          fontWeight: FontWeight.w600,
          textColor: AppContants.lightGreyColor,
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
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Column(
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'Address',
                          textSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.grey),
                      CustomProfileContainer(text: ''),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                          text: 'Street number',
                          textSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.grey),
                      CustomProfileContainer(text: ''),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                          text: 'house number',
                          textSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.grey),
                      CustomProfileContainer(text: ''),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                          text: 'Phone number',
                          textSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.grey),
                      CustomProfileContainer(text: ''),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        child: CustomBorderColor(
                            onPressed: () {
                              NavigationHelperPush.pushRoute(context, PaymentScreen());
                            },
                            label: 'Confirm',
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
            ),
          ],
        ),
      ),
    );
  }
}
