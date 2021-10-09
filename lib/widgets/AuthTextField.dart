import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final bool visible;
  final String hint;
  final Function(String) validator;
  final TextEditingController controller;
 final double padding;
  AuthTextField(
      {required this.label,
        required this.validator,
        required this.controller,

        this.visible = false, required this.hint, required this.padding});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        validator: (val) => validator(val!),
        controller: controller,
        obscureText: visible,
        style: TextStyle(
            letterSpacing: 1,
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600),
        decoration: new InputDecoration(
          hintText: hint,
            labelText: label,
          border: new OutlineInputBorder(
            borderRadius:BorderRadius.circular(8) ,
            borderSide: new BorderSide(color: Color(0xff5079D8))

        ),
          enabledBorder: new OutlineInputBorder(
              borderRadius:BorderRadius.circular(8) ,
              borderSide: new BorderSide(color: Color(0xff5079D8))

          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(12)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: new OutlineInputBorder(
              borderRadius:BorderRadius.circular(8) ,
              borderSide: new BorderSide(color: Color(0xff5079D8))

          ),
            ),
      ),
    );

  }
}
