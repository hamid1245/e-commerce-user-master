import 'package:e_commerc/models/productsModel/ProductsModel.dart';
import 'package:e_commerc/navigator/navigatorHelperPush.dart';
import 'package:e_commerc/res.dart';
import 'package:e_commerc/ui/cart/cartScreen.dart';
import 'package:e_commerc/ui/products/buyScreen/BuyScreen.dart';
import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/buttons/customBorderColor.dart';
import 'package:e_commerc/widgets/buttons/customColorButton.dart';
import 'package:e_commerc/widgets/category/categoryCustomCard.dart';
import 'package:e_commerc/widgets/customAppBar.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List sizeItem = [
    'us 7',
    'us 8',
    'us 9',
    'us 10',
    'us 11',
  ];
  List selectedSize = [];
  List<ProductsModel> testList = [
    ProductsModel(Res.shoes2, 'Nike 100s pro', '1.0', '\$100'),
    ProductsModel(Res.shoes, 'Nike 10s max', '3.0', '\$100'),
    ProductsModel(Res.shoes, 'Nike news ero', '5.0', '\$100'),
    ProductsModel(Res.shoes2, 'Nike 68 o', '1.5', '\$100'),
    ProductsModel(Res.shoes2, 'Nike 120s pro', '3.4', '\$100'),
    ProductsModel(Res.shoes, 'Nike 30s pro', '4.9', '\$100'),
    ProductsModel(Res.shoes2, 'Nike 120s pro', '4.6', '\$100'),
    ProductsModel(Res.shoes, 'Nike 330s pro', '4.0', '\$100'),
    ProductsModel(Res.shoes, 'Nike 40s pro', '5.0', '\$100'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(context, text: 'Nike 90s max',
            textSize: 18,
            fontWeight: FontWeight.w600,
            textColor: Colors.white,
            elevation: 0,
            backicon: Icons.arrow_back_ios,
            appBarColor: Color(0xff4D75D1),
            onPressed: () {
              Navigator.pop(context);
            }),
        body: _getUI(context),);
  }

  Widget _getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                    gradient: AppContants.containerGradientColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  transform: Matrix4.translationValues(0, 25.0, 0.0),
                  height: 155,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    boxShadow: AppContants.appShadow,
                    borderRadius: BorderRadius.circular(24),
                    color: Color(0xffF8F8F8),
                  ),
                  child: Image.asset(Res.shoes2),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 10, bottom: 10),
            child: CustomText(
                text: "\$100",
                textSize: 19,
                fontWeight: FontWeight.w600,
                textColor: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: 88,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: testList.length,
                itemBuilder: (context, i) {
                  return Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xff5079D8).withOpacity(0.1),
                    ),
                    child: Image.asset(Res.shoes2),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 150,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: Color(0xffFBFBFB),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CustomText(
                        text:
                        'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: AppContants.lightGreyColor))),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23)),
                color: Color(0xffFBFBFB)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 12),
                  child: CustomText(
                      text: "Chose size",
                      textSize: 16,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sizeItem.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                onTap: () {
                                  selectedSize.clear();
                                  selectedSize.add(i);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 23,
                                  width: 56,
                                  decoration: BoxDecoration(
                                      color: selectedSize.contains(i)
                                          ? Color(0xff5079D8)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(color: Color(0xff5079D8))),
                                  child: Center(
                                      child: CustomText(
                                          text: sizeItem[i],
                                          textSize: 10,
                                          fontWeight: FontWeight.w600,
                                          textColor: selectedSize.contains(i)
                                              ? Colors.white
                                              : Colors.black)),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomBorderColor(
                            onPressed: () {
                              NavigationHelperPush.pushRoute(
                                  context, CartScreen());
                            },
                            label: "add to cart",
                            width: 150,
                            hight: 45,
                            textSize: 14,
                            textWeight: FontWeight.bold,
                            textColor: Color(0xff5079D8),
                            buttonColor: Colors.white),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: CustomColorButton(
                            onPressed: () {
                              NavigationHelperPush.pushRoute(
                                  context, BuyScreen());
                            },
                            label: 'Buy',
                            width: 150,
                            hight: 45,
                            textSize: 13,
                            textWeight: FontWeight.bold,
                            textColor: Colors.white,
                            buttonColor: Color(0xff5079D8)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
