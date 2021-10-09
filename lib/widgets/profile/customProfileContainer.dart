import 'package:e_commerc/utils/constants.dart';
import 'package:flutter/material.dart';

import '../customText.dart';
class CustomProfileContainer extends StatelessWidget {
  final String text;

  const CustomProfileContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppContants.appBaseColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 10),
        child: CustomText(text: text, textSize: 12, fontWeight: FontWeight.w500, textColor: Colors.black),
      ),
    );
  }
}
