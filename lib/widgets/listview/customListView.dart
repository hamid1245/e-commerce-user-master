import 'package:e_commerc/utils/constants.dart';
import 'package:e_commerc/widgets/buttons/customBorderColor.dart';
import 'package:e_commerc/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../res.dart';

class CustomListView extends StatefulWidget {
  final String image;
  final String productTitle;
  final String productPrice;
  final VoidCallback onPressed;

  const CustomListView(
      {Key? key,
      required this.image,
      required this.productTitle,
      required this.productPrice,
      required this.onPressed})
      : super(key: key);

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView>
    with SingleTickerProviderStateMixin {
  bool isFav = false;

  late AnimationController _controller;
   late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _colorAnimation= ColorTween(begin: Colors.grey[300],end: Colors.redAccent).animate(_controller);

    // _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
    //     .animate(_controller);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //       color: Colors.grey, blurRadius: 1.0, offset: Offset(0, 0.3))
          // ],
          border:
              Border.all(color: AppContants.lightGreyColor.withOpacity(0.1)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(top: 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 115,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    // image: DecorationImage(
                    //     image: AssetImage(mylist[index]['image']), fit: BoxFit.cover),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.asset(widget.image),
                  ),
                ),
                Container(
                  height: 115,
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Wrap(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                    text: widget.productTitle,
                                    textSize: 18,
                                    fontWeight: FontWeight.bold,
                                    textColor: Colors.black),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    color: Colors.transparent,
                                    child: AnimatedBuilder(
                                      animation: _controller,
                                      builder: (BuildContext context, _) {
                                        return IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: _colorAnimation.value,
                                            size: _sizeAnimation.value,
                                          ),
                                          iconSize: 23,
                                          onPressed: () {
                                            isFav? _controller.reverse():_controller.forward();
                                          },
                                          color: Colors.black,
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: CustomText(
                                    text: widget.productPrice,
                                    textSize: 12,
                                    fontWeight: FontWeight.w600,
                                    textColor: Colors.black)),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                      child: CustomBorderColor(
                                          onPressed: () => widget.onPressed(),
                                          label: 'Add to Cart',
                                          width: 12,
                                          hight: 30,
                                          textSize: 12,
                                          textWeight: FontWeight.bold,
                                          textColor: Color(0xff5079D8),
                                          buttonColor: Colors.white))
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
