import 'package:flutter/material.dart';
import 'package:flutter_auth/PlantAppFiles/screens/details/details_screen.dart';
import 'package:flutter_auth/PlantAppFiles/screens/home/components/header_with_seachbox.dart';
import 'package:flutter_auth/PlantAppFiles/screens/home/components/recomend_plants.dart';

import 'components/SharedConst.dart';
import 'constants.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {


  List<SharedConstUi> _cardModel;

  void RecomendedPlantCardModel(){
    _cardModel = List<SharedConstUi>();

    _cardModel.add(SharedConstUi('assets/images/bottom_img_2.png', "Angelica", "Egypt", 440));

    _cardModel.add(SharedConstUi('assets/images/image_1.png', "Angelica", "Iraq", 540));

    _cardModel.add(SharedConstUi('assets/images/image_2.png', "Angelica", "syria", 640));

    _cardModel.add(SharedConstUi('assets/images/image_3.png', "Angelica", "Philistine", 740));

    _cardModel.add(SharedConstUi('assets/images/image_3.png', "Angelica", "Turkey", 740));
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size *1.0;
    RecomendedPlantCardModel();

    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:kPrimaryColor ,
      ),
      body: new Column(
        children: <Widget>[

          HeaderWithSearchBox(size: size),

         Expanded(
           child: Transform.translate(
             offset: Offset(10,-30),
             child: new Center(
               child: new Container(
                 width: double.infinity,
                 height: MediaQuery.of(context).size.height * 5,

                 child: new ListView.builder(itemBuilder:(context,index){

                      return new Row(
                        children: [

                          new RecomendPlantCard(
                            image: _cardModel[index].image,
                            title: _cardModel[index].title,
                            country: _cardModel[index].country,
                            price: _cardModel[index].price,
                            color: Colors.black54,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(),
                                ),
                              );
                            },
                          ),
                          new RecomendPlantCard(
                            image: _cardModel[index+1].image,
                            title: _cardModel[index+1].title,
                            country: _cardModel[index+1].country,
                            price: _cardModel[index+1].price,
                            color: Colors.black54,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(),
                                ),
                              );
                            },
                          ),

                        ]
                      );

                 },
                   itemCount:4,
                 ),
               ),
             ),
           ),
         )





        ],
      ),
    );
  }
}


