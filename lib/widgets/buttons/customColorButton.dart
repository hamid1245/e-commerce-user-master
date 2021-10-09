import 'package:e_commerc/widgets/customText.dart';
import 'package:flutter/material.dart';

class CustomColorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double width;
  final double hight;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;
  final Color buttonColor;

  const CustomColorButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.width,
      required this.hight,
      required this.textSize,
      required this.textWeight,
      required this.textColor, required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: CustomText(
                text: label,
                textSize: textSize,
                fontWeight: textWeight,
                textColor: textColor)),
      ),
    );
  }
}
