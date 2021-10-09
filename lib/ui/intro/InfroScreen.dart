import 'package:e_commerc/navigator/navigatorHelperPush.dart';
import 'package:e_commerc/navigator/navigatorHelperReplace.dart';
import 'package:e_commerc/ui/auth/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    NavigationHelperReplace.replaceRoute(context, LoginScreen());
  }
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 15.0 , color: Colors.grey , fontWeight: FontWeight.w300);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title:'Buy Products',
          body:
              "There are many variation s of passages of Lorem Ipsum available, but the majority have suffered alteration in some form",
          image: Image.asset('assets/images/img1.png'),
          decoration: pageDecoration,

        ),
        PageViewModel(
          title: "Login to acess",
          body:
              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form",
          image:Image.asset('assets/images/img2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Enjoy Products",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: Image.asset('assets/images/img3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: Container(

         child: Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
