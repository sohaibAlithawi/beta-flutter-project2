import 'package:flutter/material.dart';

import 'details/details_screen.dart';
import 'home/components/recomend_plants.dart';

class MoreScreenFeaturePlants extends StatefulWidget {
  @override
  _MoreScreenFeaturePlantsState createState() => _MoreScreenFeaturePlantsState();
}

class _MoreScreenFeaturePlantsState extends State<MoreScreenFeaturePlants> {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(

      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[

            Transform.translate(
              offset: Offset(0,50),
              child: new Row(
                children: <Widget>[

                  RecomendPlantCard(
                    image: "assets/images/image_1.png",
                    title: "Angelica",
                    country: "Russia",
                    price: 440,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(),
                        ),
                      );
                    },
                  ),
                  RecomendPlantCard(
                    image: "assets/images/image_1.png",
                    title: "Angelica",
                    country: "Russia",
                    price: 440,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0,20),
              child: new Row(
                children: <Widget>[

                  RecomendPlantCard(
                    image: "assets/images/image_1.png",
                    title: "Angelica",
                    country: "Russia",
                    price: 440,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(),
                        ),
                      );
                    },
                  ),
                  RecomendPlantCard(
                    image: "assets/images/image_1.png",
                    title: "Angelica",
                    country: "Russia",
                    price: 440,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0,-10),
              child: new Row(
                children: <Widget>[

                  RecomendPlantCard(
                    image: "assets/images/image_1.png",
                    title: "Angelica",
                    country: "Russia",
                    price: 440,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(),
                        ),
                      );
                    },
                  ),
                  RecomendPlantCard(
                    image: "assets/images/image_1.png",
                    title: "Angelica",
                    country: "Russia",
                    price: 440,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}
