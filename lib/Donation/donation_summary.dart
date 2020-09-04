import 'package:donate/Food/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              new Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Donation Summary',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 30),
                      )),
                  Image.asset('images/summary1.png', width: 300, height: 220),
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.user,
                        color: Colors.redAccent,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Donated by me:Rs 500',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 22),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.users,
                        color: Colors.indigoAccent,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Donated by everyone:\nRs 10000 ',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 22),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.handsHelping,
                        color: Colors.green,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'No. of goals supported:\n 3',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 22),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  )),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.white70)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonatePage()),
                  );
                },
                child: const Text('Click her to track the NGOs',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                color: Color(0xFF64B5F6),
                textColor: Colors.white,
                elevation: 15,
              ),
            ])));
  }
}
