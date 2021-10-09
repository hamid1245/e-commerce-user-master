import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AuthButton({ required this.onPressed}) ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onPressed,
      child: Container(
        height: 70,
        width: 75,
        child: Image.asset('assets/images/authButton.png'),
      ),
    );
  }
}
