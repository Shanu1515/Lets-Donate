import 'package:donate/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Auth()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('images/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFFB3E5FC),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Quick Donations at your fingertips",
          body:
              "Donations accepted in different forms: Money,Food,Clothes and Others",
          image: _buildImage('page1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Pickup from doorstep",
          body:
              "No need to worry about sending the item to the desired NGOs.We take care of that.",
          image: _buildImage('page2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Secure and Transparent Donation platform",
          body:
              "You can keep the track of donations you made and also the overall donations for the particular cause",
          image: _buildImage('page3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Supported by UN's Sustainable development goals",
          body:
              "Select the desired goals and show your contributions with just a click",
          image: _buildImage('page4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Small actions x lots of people= Big Change",
          body:
              "Happiness doesn't result from what we get, but from what we give.\nSo Lets-Donate",
          image: _buildImage('page5'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}
