import 'package:donate/Signup/signup.dart';
import 'package:donate/Splashscreen/splash.dart';
import 'package:donate/sigin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: <String, WidgetBuilder>{
      '/Home1': (BuildContext context) => Auth(),
    },
    debugShowCheckedModeBanner: false,
    home: Initial(),
  ));
}

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 140,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("images/main_top.png"),
                    fit: BoxFit.fill)),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: ExactAssetImage("images/logo.png"),
                      fit: BoxFit.contain)),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              height: 60,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signin()));
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.deepPurple[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 300,
              height: 60,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                color: Colors.deepPurpleAccent[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
                width: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("images/main_bottom.png"),
                      fit: BoxFit.fill),
                )),
          ),
        ],
      ),
    );
  }
}
