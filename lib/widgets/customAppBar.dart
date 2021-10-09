import 'package:flutter/material.dart';

import 'customText.dart';

CustomAppBar(BuildContext context,
    {required String text,
    required double textSize,
    required FontWeight fontWeight,
    required Color textColor,
    required VoidCallback onPressed,
    required double elevation,
    required IconData backicon,
        required Color appBarColor
    }) {

    return AppBar(
        elevation: elevation,
        backgroundColor: appBarColor,
        title: CustomText(
            text: text,
            textSize: textSize,
            fontWeight: fontWeight,
            textColor: textColor),
        leading: GestureDetector(
            onTap: () => onPressed(),
            child: Icon(
                backicon,
                color: Colors.black,
                size: 18,
            ),
        ),
        centerTitle: true,
    );
}
