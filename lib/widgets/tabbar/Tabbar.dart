import 'package:e_commerc/navigator/navigatorHelperPush.dart';
import 'package:e_commerc/ui/cart/cartScreen.dart';
import 'package:e_commerc/ui/homeScreen.dart';
import 'package:e_commerc/ui/products/favouritproducts.dart';
import 'package:e_commerc/ui/products/profile/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class TabBarW extends StatefulWidget {

  @override
  _TabBarWState createState() => _TabBarWState();
}

class _TabBarWState extends State<TabBarW> {
  int _selectedIndex = 0;
  late List<Object> _tabs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs  = [
      HomeScreen(),
      FavouritProduct(),
      CartScreen(),
      ProfileScreen()
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey.shade200,
      child: GNav(
          haptic: true, // haptic feedback
          tabBorderRadius: 25,
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 200), // tab animation duration
          gap: 4, // th// e tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: Colors.black, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: Color(0x5E5079D8), // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home,iconColor: Color(0xff808080),
              text: 'Home',
              onPressed: (){

              },
            ),
            GButton(
              icon: Icons.favorite,iconColor: Color(0xff808080),
              text: 'Favourite',
              onPressed: (){
              },

            ),
            GButton(
              icon: Icons.shopping_cart ,iconColor: Color(0xff808080),
              text: 'Cart',


            ),
            GButton(
              icon: Icons.supervised_user_circle,iconColor: Color(0xff808080),
              text: 'Profile',

            ),

          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }
      ),
    );
  }
}
