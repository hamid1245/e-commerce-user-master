import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc/navigator/navigatorHelperPush.dart';
import 'package:e_commerc/ui/cart/cartScreen.dart';
import 'package:e_commerc/ui/notification/notificationScreen.dart';
import 'package:e_commerc/ui/products/category/productsScreen.dart';
import 'package:e_commerc/ui/products/favouritproducts.dart';
import 'package:e_commerc/ui/products/profile/profileScreen.dart';
import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/buttons/customColorButton.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:e_commerc/widgets/tabbar/Tabbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../res.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<dynamic> _tabs = [
    FirstScreen(),
    FavouritProduct(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          haptic: true,
          // haptic feedback
          tabBorderRadius: 25,
          curve: Curves.easeOutExpo,
          // tab animation curves
          duration: Duration(milliseconds: 200),
          // tab animation duration
          gap: 4,
          // th// e tab button gap between icon and text
          color: Colors.grey[800],
          // unselected icon color
          activeColor: Colors.black,
          // selected icon and text color
          iconSize: 24,
          // tab button icon size
          tabBackgroundColor: Color(0x5E5079D8),
          // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: Color(0xff808080),
              text: 'Home',
              onPressed: () {},
            ),
            GButton(
              icon: Icons.favorite,
              iconColor: Color(0xff808080),
              text: 'Favourite',
              onPressed: () {},
            ),
            GButton(
              icon: Icons.shopping_cart,
              iconColor: Color(0xff808080),
              text: 'Cart',
            ),
            GButton(
              icon: Icons.supervised_user_circle,
              iconColor: Color(0xff808080),
              text: 'Profile',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: _tabs[_selectedIndex],
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _DiscribtionController = TextEditingController();
  TextEditingController _search = TextEditingController();
  List catList = [
    {
      'name': 'Shoes',
      'image': 'assets/images/shoes3.png',
      'price': '\$300',
    },
    {'name': 'Watch', 'image': 'assets/images/watch.png', 'price': '\$500'},
    {
      'name': 'T-Shirts',
      'image': 'assets/images/catShirt.png',
      'price': '\$100'
    },
    {'name': 'Hoodie', 'image': 'assets/images/hoodie.png', 'price': '\$400'}
  ];
  List itemList = [
    {'name': 'Nike 10', 'image': 'assets/images/shoes.png', 'price': '\$300'},
    {'name': 'G-Shock', 'image': 'assets/images/watch2.png', 'price': '\$500'},
    {
      'name': 'T-Shirts',
      'image': 'assets/images/tshirt1.png',
      'price': '\$100'
    },
    {'name': 'Hoodie', 'image': 'assets/images/hoodie2.png', 'price': '\$400'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                        gradient: AppContants.containerGradientColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        )),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50.0, left: 20, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: Colors.white)),
                            child: Container(
                              height: 30,
                              width: 200,
                              child: TextField(
                                controller: _search,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                                decoration: InputDecoration(
                                  hintText: 'I want to buy',
                                  hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 12),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                              height: 40,
                              width: 50,
                              child: IconButton(
                                  onPressed: () {
                                    NavigationHelperPush.pushRoute(
                                        context, NotificationScreen());
                                  },
                                  icon: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                    size: 30,
                                  )))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, 120.0, 0.0),
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.transparent),
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: AppContants.homeContainer,
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: AppContants.appShadow,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 150,
                                        child: CustomText(
                                            text: "New Item new Here",
                                            textSize: 16,
                                            fontWeight: FontWeight.bold,
                                            textColor: Colors.white)),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomColorButton(
                                        onPressed: () {},
                                        label: 'Check',
                                        width: 100,
                                        hight: 35,
                                        textSize: 14,
                                        textWeight: FontWeight.normal,                                        textColor: Colors.black,
                                        buttonColor: Colors.white)
                                  ],
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(Res.shoes2))
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 3,
                      autoplay: true,
                      viewportFraction: 0.8,
                      scale: 0.9,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 60, left: 20, right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: "Popular categories",
                            textSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: AppContants.lightGreyColor),
                        InkWell(
                          onTap: () {
                            NavigationHelperPush.pushRoute(
                                context, ProductsScreen());
                          },
                          child: CustomText(
                              text: "See all",
                              textSize: 14,
                              fontWeight: FontWeight.w600,
                              textColor: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 82,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1,
                          mainAxisSpacing: 10,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, i) {
                          return Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xffEBEBEB)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                          Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    '${catList[i]['image']}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                CustomText(
                                    text: catList[i]['name'],
                                    textSize: 12,
                                    fontWeight: FontWeight.bold,
                                    textColor: Colors.black)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 20),
                    child: CustomText(
                        text: "Trending Items",
                        textSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 550,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: .70,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                        scrollDirection: Axis.vertical,
                        itemCount: catList.length,
                        itemBuilder: (context, i) {
                          return Container(
                            height: 150,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xffEBEBEB)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                        '${itemList[i]['image']}',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CustomText(
                                      text: itemList[i]['name'],
                                      textSize: 12,
                                      fontWeight: FontWeight.bold,
                                      textColor: AppContants.lightGreyColor),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CustomText(
                                      text: itemList[i]['price'],
                                      textSize: 11,
                                      fontWeight: FontWeight.normal,
                                      textColor: AppContants.lightGreyColor),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: CustomColorButton(
                                      onPressed: () {
                                        _addDataToCard(itemList[i]);
                                      },
                                      label: 'Add to cart',
                                      width: 80,
                                      hight: 20,
                                      textSize: 11,
                                      textWeight: FontWeight.w600,
                                      textColor: Colors.white,
                                      buttonColor: AppContants.appBaseColor),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _addDataToCard(var item) async {
    try {
      await FirebaseFirestore.instance.collection('cart').doc().set({
        'productName': item["name"],
        'productPrice': item["price"],
        'productImage': item["image"],
      }).whenComplete(() => Fluttertoast.showToast(msg: 'product uploded'));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: 'Error');
    }
  }
}
