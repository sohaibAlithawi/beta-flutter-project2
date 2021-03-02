import 'package:flutter/material.dart';
import 'package:flutter_auth/PlantAppFiles/screens/details/details_screen.dart';
import 'package:flutter_auth/PlantAppFiles/screens/home/components/header_with_seachbox.dart';
import 'package:flutter_auth/PlantAppFiles/screens/home/components/recomend_plants.dart';

import 'constants.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size *1.0;
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:kPrimaryColor ,
      ),
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[

            HeaderWithSearchBox(size: size),

            Transform.translate(
              offset: Offset(0,-20),

              child: new Column(
                children: [
                  Transform.translate(
                    offset: Offset(0,50),
                    child: new Row(
                      children: <Widget>[

                        RecomendPlantCard(
                          image: "assets/images/image_1.png",
                          title: "Angelica",
                          country: "Russia",
                          price: 440,
                          color: Colors.black87,
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
                          color: Colors.black87,

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
                          color: Colors.black87,

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
                          color: Colors.black87,

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
                          color: Colors.black87,

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
                          color: Colors.black87,

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

            )





          ],
        ),
      ),
    );
  }
}
