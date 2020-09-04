import 'package:donate/Donate/donate.dart';
import 'package:donate/Donation/donation_summary.dart';
import 'package:donate/Explore/explore.dart';
import 'package:donate/Feedback/feddback.dart';
import 'package:donate/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

Widget widget;

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int selected = 0;

  void screen(int i) {
    switch (i) {
      case 0:
        widget = Explore();
        break;
      case 1:
        widget = FeedBack();
        break;
      case 2:
        widget = Donate();
        break;
      case 3:
        widget = Summary();
        break;
      case 4:
        widget = Profile();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selected,
          onTap: (int index) {
            setState(() {
              selected = index;
              screen(index);
            });
          },
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          selectedItemColor: Colors.deepPurple,
          elevation: 20,
          backgroundColor: Colors.white54,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                ),
                title: Text(
                  "EXPLORE",
                )),
            BottomNavigationBarItem(
                icon: Icon(MaterialIcons.feedback), title: Text("FEEDBACK")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.handHoldingHeart),
                title: Text("DONATE")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.database), title: Text("DONATION")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("PROFILE"))
          ]),
    );
  }
}
