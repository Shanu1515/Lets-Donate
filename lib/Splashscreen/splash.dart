import 'package:custom_splash/custom_splash.dart';
import 'package:donate/Boarding/onboarding.dart';
import 'package:flutter/material.dart';

class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return CustomSplash(
      imagePath: 'images/splash.png',
      backGroundColor: Colors.deepOrange[200],
      animationEffect: 'zoom-in',
      logoSize: 200,
      home: App(),
      duration: 8800,
      type: CustomSplashType.StaticDuration,
    );
  }
}
