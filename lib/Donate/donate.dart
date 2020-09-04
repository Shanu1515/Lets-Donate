import 'package:donate/Donate/category.dart';
import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Donate> {
  List<String> images = [
    "images/18.png",
    "images/19.png",
    "images/20.png",
    "images/21.png",
    "images/22.png",
    "images/23.png",
    "images/24.png",
    "images/25.png",
    "images/26.png",
    "images/27.png",
    "images/28.png",
    "images/29.png",
    "images/30.png",
    "images/31.png",
    "images/32.png",
    "images/33.png",
    "images/34.png"
  ];
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Select the goal for contribution",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              )),
        ),
        Expanded(
            child: Container(
          child: GridView.builder(
              itemCount: 17,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Category()));
                      },
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(images[index]),
                              fit: BoxFit.fill),
                        ),
                      )),
                );
              }),
        ))
      ],
    ));
  }
}
