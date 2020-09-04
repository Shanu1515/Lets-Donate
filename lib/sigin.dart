import 'package:donate/testingscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'GoogleAuth/google.dart';

AuthResult authResult;
String user;

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  var email = "";
  var passwd = "";

  Future<AuthResult> signIn(String email, String password) async {
    try {
      AuthResult user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      assert(user != null);
      assert(await user.user.getIdToken() != null);

      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.user.uid == currentUser.uid);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 140,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("images/signup_top.png"),
                      fit: BoxFit.contain)),
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("images/logo.png"),
                        fit: BoxFit.contain)),
              ),
            ),
            Form(
                key: formkey,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.deepPurpleAccent[100]),
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty || !value.contains("@")) {
                                return "Please Enter the correct emailid";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                                hintText: "Input Email",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.deepPurple,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.deepPurpleAccent[100]),
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty || value.length < 7) {
                                return "Password must be 7 characters long";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            onSaved: (value) {
                              passwd = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.deepPurple,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Container(
              width: 350,
              height: 70,
              child: FlatButton(
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  onPressed: () async {
                    if (formkey.currentState.validate()) {
                      formkey.currentState.save();
                      signIn(email, passwd).then((user) {
                        if (user != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Test()));
                        } else {
                          print("not");
                        }
                      });
                    }
                  },
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            )),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Container(
              width: 350,
              height: 70,
              child: FlatButton(
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  onPressed: () async {
                    signInWithGoogle().whenComplete(() async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Test();
                          },
                        ),
                      );
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: ExactAssetImage("images/google.jpg"),
                        radius: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Login With Google",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
