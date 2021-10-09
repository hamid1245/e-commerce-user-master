import 'package:flutter/material.dart';
class SoicalMediaButton extends StatelessWidget {
final String socialImage;
final VoidCallback onPress;

   SoicalMediaButton({required this.socialImage, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> onPress(),
      child: Container(
        height: 40,
        width: 40,
        child: Image.asset(socialImage,fit: BoxFit.cover,),
      ),
    );
  }
}
