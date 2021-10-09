import 'package:e_commerc/utils/constants.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppContants.buttonColor

      ),
      child: Center(child: Text('Hello')),
    );
  }
}
