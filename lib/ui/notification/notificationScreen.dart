import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/customAppBar.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context,
          text: 'Notifications',
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
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                      text: 'Order Completed',
                      textSize: 14,
                      fontWeight: FontWeight.normal,
                      textColor: Colors.black),
                  CustomText(
                      text: '1/28/2021',
                      textSize: 8,
                      fontWeight: FontWeight.normal,
                      textColor: AppContants.lightGreyColor),
                  CustomText(
                      text: 'Your order is completed',
                      textSize: 12,
                      fontWeight: FontWeight.normal,
                      textColor: AppContants.lightGreyColor),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.black12,
                  )
                ],
              ),
            ),
          );
        });
  }
}
