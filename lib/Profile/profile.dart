import 'package:donate/Global/global.dart';
import 'package:donate/GoogleAuth/google.dart';
import 'package:donate/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Profile> {
  List<String> string1 = ["Account", "App Feedback", "About us", "Logout"];
  List<String> subtitle = [
    "Change your primary Email & Mobile Number",
    " How is your Experience using Let's-Donate\n Write to us for any queries",
    "Who we are.Vision.Mission",
    "Logout from the app"
  ];
  List<Icon> icon = [
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.feedback,
      color: Colors.black,
    ),
    Icon(
      Icons.info,
      color: Colors.black,
    ),
    Icon(
      Icons.exit_to_app,
      color: Colors.black,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 350,
          color: Colors.deepPurple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage("assets/img2.png"),
                      radius: 68,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: null)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Shanu Mishra",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "shanumishra.srmuav@gmail.com",
                  style: TextStyle(
                      color: Colors.white30,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    children: [
                      IconButton(
                          icon: icon[index],
                          onPressed: () {
                            if (index == 3) {
                              signOutGoogle().whenComplete(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Auth()));
                              });
                            }
                          }),
                      Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Text(
                              string1[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            subtitle[index],
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
              itemCount: 4),
        ))
      ],
    ));
  }
}
