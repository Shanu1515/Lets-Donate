import 'package:donate/Food/food.dart';
import 'package:donate/Payment/payment.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          Center(
            child: Text(
              "Select Category",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: Text(
              "What would you like to donate today",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(
              child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView(
                children: [
                  InkWell(
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: 240,
                        height: 340,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage("images/clothes.png"),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonatePage()));
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: 240,
                        height: 340,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage("images/food.png"),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: 240,
                        height: 340,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage("images/money.png"),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: 240,
                        height: 340,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage("images/others.png"),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  )
                ],
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 2),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
