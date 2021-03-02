import 'package:flutter/material.dart';
import 'package:flutter_auth/PlantAppFiles/MoreScreenrRecomended.dart';

import '../../../constants.dart';

class FeaturedPlants extends StatelessWidget {

  const FeaturedPlants({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          InkWell(
            //onTap: () {
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>MoreScreen()));
            //  },
            child: Ink.image(
              image: ExactAssetImage("assets/images/bottom_img_1.png"),
              child: FeaturePlantCard(
                image: "",

              ),
            ),
          ),
          InkWell(
          // onTap: () {

    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>MoreScreen()));
            // },
            child: Ink.image(
              image: ExactAssetImage("assets/images/bottom_img_1.png"),
              child: FeaturePlantCard(
                image: "",

              ),
            ),
          ),


        ],
      ),
    );
  }
}
class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key key,
    this.image,

  }) : super(key: key);
  final String image;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(

      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
