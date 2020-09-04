import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int a = 0;
  bool check = false;
  List<Color> color1 = [
    Colors.red,
    Colors.amber,
    Colors.green,
    Colors.red,
    Colors.redAccent,
    Colors.lightBlue,
    Colors.yellowAccent,
    Colors.red[800],
    Colors.deepOrange,
    Colors.pink,
    Colors.deepOrange[300],
    Colors.brown[500],
    Colors.green[700],
    Colors.blue,
    Colors.green,
    Colors.blue[900],
    Colors.blueAccent[200]
  ];
  List<String> content = [
    "Eradicating poverty in all its forms remains one of the greatest challenges facing humanity. While the number of people living in extreme poverty dropped by more than half between 1990 and 2015, too many are still struggling for the most basic human needs.\nAs of 2015, about 736 million people still lived on less than US.90 a day; many lack food, clean drinking water and sanitation. Rapid growth in countries such as China and India has lifted millions out of poverty, but progress has been uneven. Women are more likely to be poor than men because they have less paid work, education, and own less property.",
    "The number of undernourished people has dropped by almost half in the past two decades because of rapid economic growth and increased agricultural productivity. \nMany developing countries that used to suffer from famine and hunger can now meet their nutritional needs. Unfortunately, extreme hunger and malnutrition remain a huge barrier to development in many countries The SDGs aim to end all forms of hunger and malnutrition by 2030, making sure all people–especially children–have sufficient and nutritious food all year. This involves promoting sustainable agricultural, supporting small-scale farmers and equal access to land, technology and markets. It also requires international cooperation to ensure investment in infrastructure and technology to improve agricultural productivity.",
    "We have made great progress against several leading causes of death and disease. Life expectancy has increased dramatically; infant and maternal mortality rates have declined, we’ve turned the tide on HIV and malaria deaths have halved.\nGood health is essential to sustainable development and the 2030 Agenda reflects the complexity and interconnectedness of the two. It takes into account widening economic and social inequalities, rapid urbanization, threats to the climate and the environment, the continuing burden of HIV and other infectious diseases, and emerging challenges such as noncommunicable diseases. Universal health coverage will be integral to achieving SDG 3, ending poverty and reducing inequalities.",
    "Since 2000, there has been enormous progress in achieving the target of universal primary education. The total enrolment rate in developing regions reached 91 percent in 2015, and the worldwide number of children out of school has dropped by almost half.\n There has also been a dramatic increase in literacy rates, and many more girls are in school than ever before Achieving inclusive and quality education for all reaffirms the belief that education is one of the most powerful and proven vehicles for sustainable development. This goal ensures that all girls and boys complete free primary and secondary schooling by 2030.",
    "Ending all discrimination against women and girls is not only a basic human right, it’s crucial for sustainable future; it’s proven that empowering women and girls helps economic growth and development.\nUNDP has made gender equality central to its work and we’ve seen remarkable progress in the past 20 years. There are more girls in school now compared to 15 years ago, and most regions have reached gender parity in primary education.",
    "Water scarcity affects more than 40 percent of people, an alarming figure that is projected to rise as temperatures do. Although 2.1 billion people have improved water sanitation since 1990, dwindling drinking water supplies are affecting every continent.\nMore and more countries are experiencing water stress, and increasing drought and desertification is already worsening these trends. By 2050, it is projected that at least one in four people will suffer recurring water shortages.",
    "Between 2000 and 2016, the number of people with electricity increased from 78 to 87 percent, and the numbers without electricity dipped to just below one billion.Yet as the population continues to grow, so will the demand for cheap energy, \nand an economy reliant on fossil fuels is creating drastic changes to our climate.Investing in solar, wind and thermal power, improving energy productivity, and ensuring energy for all is vital if we are to achieve SDG 7 by 2030.",
    " Over the past 25 years the number of workers living in extreme poverty has declined dramatically, despite the lasting impact of the 2008 economic crisis and global recession. In developing countries, \nthe middle class now makes up more than 34 percent of total employment – a number that has almost tripled between 1991 and 2015.The SDGs promote sustained economic growth, higher levels of productivity and technological innovation.",
    " Investment in infrastructure and innovation are crucial drivers of economic growth and development. Technological progress is also key to finding lasting solutions to both economic and environmental challenges, \nsuch as providing new jobs and promoting energy efficiency. More than 4 billion people still do not have access to the Internet, and 90 percent are from the developing world. Bridging this digital divide is crucial to ensure equal access to information and knowledge, as well as foster innovation and entrepreneurship.",
    "Income inequality is on the rise—the richest 10 percent have up to 40 percent of global income whereas the poorest 10 percent earn only between 2 to 7 percent.Income inequality requires global solutions.\n This involves improving the regulation and monitoring of financial markets and institutions, encouraging development assistance and foreign direct investment to regions where the need is greatest. Facilitating the safe migration and mobility of people is also key to bridging the widening divide."
  ];
  List<String> images = [
    "images/1.png",
    "images/2.png",
    "images/3.png",
    "images/4.png",
    "images/5.png",
    "images/6.png",
    "images/7.png",
    "images/8.png",
    "images/9.png",
    "images/10.png",
    "images/11.png",
    "images/12.png",
    "images/13.png",
    "images/14.png",
    "images/15.png",
    "images/16.png",
    "images/17.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          shadows: [
                            Shadow(color: Colors.black, blurRadius: 40)
                          ]),
                    )
                  ],
                ),
              ),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("images/goals-header.png"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              bottom: 1.0,
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: 190,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 17,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onDoubleTap: () {
                            setState(() {
                              check = false;
                            });
                          },
                          onTap: () {
                            setState(() {
                              a = index;
                              check = true;
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: Container(
                              width: 145,
                              height: 108,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                      image: ExactAssetImage(images[index]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
        if (check == true)
          Expanded(
              child: Container(
                  color: color1[a],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          content[a],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      )),
                      FlatButton(
                          color: Colors.transparent,
                          onPressed: () async {
                            const url =
                                'https://www.undp.org/content/undp/en/home/sustainable-development-goals.html';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'could not launch $url';
                            }
                          },
                          child: Text("Read more"))
                    ],
                  )))
      ],
    ));
  }
}
