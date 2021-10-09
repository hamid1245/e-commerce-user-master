import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/AuthButton.dart';
import 'package:e_commerc/widgets/AuthTextField.dart';
import 'package:e_commerc/widgets/category/categoryCustomCard.dart';
import 'package:e_commerc/widgets/listview/customListView.dart';
import 'package:flutter/material.dart';

class TextClass extends StatefulWidget {
  const TextClass({Key? key}) : super(key: key);

  @override
  _TextClassState createState() => _TextClassState();
}

class _TextClassState extends State<TextClass> {
  TextEditingController _test = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Form(
        key:_formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Positioned(
              left: 100,
                bottom: 20,

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: AppContants.appBaseColor,
                  ),

              height: 100,
              width: 100,

            )),

          ],
        ),
      ),
    );
  }
}
