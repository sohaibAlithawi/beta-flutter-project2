import 'package:flutter/material.dart';
import 'package:flutter_auth/PlantAppFiles/MoreScreenrRecomended.dart';
import 'package:flutter_auth/PlantAppFiles/constants.dart';

import 'featurred_plants.dart';
import 'header_with_seachbox.dart';
import 'recomend_plants.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomended", press: () {

            Navigator.push(context, MaterialPageRoute(builder: (context) => MoreScreen()),);

          }),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Featured Plants", press: () {

              Navigator.push(context, MaterialPageRoute(builder: (context)=>MoreScreen()));

          }),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
