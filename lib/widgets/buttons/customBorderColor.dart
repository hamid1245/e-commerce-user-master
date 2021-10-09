import 'package:e_commerc/widgets/customText.dart';
import 'package:flutter/material.dart';

class CustomBorderColor extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double width;
  final double hight;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;
  final Color buttonColor;

  const CustomBorderColor(
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
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xff5079D8))
          ),
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
