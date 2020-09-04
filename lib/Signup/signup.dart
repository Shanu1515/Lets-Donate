import 'package:donate/sigin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AuthResult authResult;
String user;

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
    var email,
    var password,
    var username,
    var number,
    var address,
    var state,
    var city,
    BuildContext ctx,
  ) async {
    try {
      authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = authResult.user.uid;
    } on PlatformException catch (err) {
      var message = "An error occured,please check your credentials";
      if (err.message != null) {
        message = err.message;
      }
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
    } catch (err) {
      print(err);
    }
  }

  final formkey = GlobalKey<FormState>();
  var _email = "";
  var _name = "";
  var _number = " ";
  var _passwd = "";
  var _passwd1 = "";
  var _address = "";
  var _state = "";
  var _city = "";

  void _trysubmit(BuildContext ctx) {
    final isvalid = formkey.currentState.validate();
    FocusScope.of(ctx).unfocus();
    if (isvalid) {
      formkey.currentState.save();
    } else {}
    _submitAuthForm(_email.trim(), _passwd.trim(), _name.trim(), _number.trim(),
        _address.trim(), _state.trim(), _city.trim(), ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage("images/logo1.jpeg"),
                      alignment: Alignment.centerRight,
                      fit: BoxFit.contain,
                    ),
                    color: Colors.transparent),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Create an Account",
                  style: TextStyle(fontSize: 25, color: Colors.black38),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 14,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onSaved: (value) {
                          _name = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                            hintText: "Enter full name",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 19)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 14,
                    color: Colors.transparent,
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
                          _email = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            border: InputBorder.none,
                            hintText: "Enter email",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 19)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 14,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty || value.length < 10) {
                            return "Please Enter the Correct number";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          _number = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.stay_primary_portrait),
                            border: InputBorder.none,
                            hintText: "Enter mobile number",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 19)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 14,
                    color: Colors.transparent,
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
                          _passwd = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            suffixIcon: Icon(Icons.visibility_off),
                            border: InputBorder.none,
                            hintText: "Enter password",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 19)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 14,
                    color: Colors.transparent,
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
                          _passwd1 = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            suffixIcon: Icon(Icons.visibility_off),
                            border: InputBorder.none,
                            hintText: "Confirm password",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 19)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 14,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onSaved: (value) {
                          _address = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.home),
                            border: InputBorder.none,
                            hintText: "Enter address",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 19)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 14,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onSaved: (value) {
                          _state = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_city),
                            border: InputBorder.none,
                            hintText: "Enter state ",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 19)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 14,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onSaved: (value) {
                          _city = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_city),
                            border: InputBorder.none,
                            hintText: "Enter city",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 19)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 14,
                  child: FlatButton(
                      color: Colors.deepPurple,
                      onPressed: () {
                        _trysubmit(context);
                      },
                      child: Center(
                        child: Text(
                          "CREATE",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )),
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 1.7),
                  Text(
                    "Existing user ?",
                    style: TextStyle(color: Colors.black38, fontSize: 15),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signin()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
