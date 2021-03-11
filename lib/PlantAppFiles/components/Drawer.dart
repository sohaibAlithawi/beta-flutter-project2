
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/PlantAppFiles/screens/PersonalInfoScreen.dart';

import '../constants.dart';

class DrawerUi extends StatelessWidget {

  List<DrawerSnackBarConst> _drawerOptions;

  void DrawerOptions() {


    _drawerOptions= List<DrawerSnackBarConst>();
    //TODO: Personal Option
    _drawerOptions.add(DrawerSnackBarConst(Icons.person,
        Colors.grey,
        30,
        "Personal Information",
        Colors.white,
        "Sorry the PersonalInfo not Ready Yet")

    );

    //TODO: Settings Option
    _drawerOptions.add(DrawerSnackBarConst(Icons.settings,
        Colors.grey,
        30,
        "Settings",
        Colors.white,
        "Sorry the Settings not Ready Yet")

    );


  }
  FirebaseAuth instance =FirebaseAuth.instance;
  DrawerUi(this.snackBarKey);
  var snackBarKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    DrawerOptions();
    return new Drawer(
        child: new Stack(
          children: <Widget> [



            ProfileImageAndName(context)
          ],
        )

    );
  }

 Widget ProfileImageAndName(BuildContext context){

    return new Stack(
      children: <Widget> [
        new Column(
          children: <Widget>[

            SizedBox(
              width: double.infinity,
              height: 250,
              child: new DrawerHeader(
                  decoration: BoxDecoration(
                      color: kPrimaryColor
                  ),
                  child: new Row(

                    children: [

                      new CircleAvatar(
                        radius: 40,
                        backgroundImage: ExactAssetImage('assets/images/profileImage.jpg'),
                      ),
                      new SizedBox(
                        width: 20,
                      ),
                      new Text("Ahmed Ali", style: TextStyle(fontSize: 23, color: Colors.white),)
                    ],
                  )
              ),
            ),

            DrawerOptionsImport(context)
          ],
        ),
      ],
    );
  }

 Widget DrawerOptionsImport(BuildContext context){

    return  Transform.translate(
        offset: Offset(0,30),
        child: new Column(
          children: <Widget>[

            new Container(
              width: double.infinity,
              height: 200,
              child: ListView.builder(physics: NeverScrollableScrollPhysics(),itemBuilder: (context,index){


                    return Column(
                    children: <Widget>[

                      new ListTile(
                        leading: Icon(_drawerOptions[index].Icon,
                        size:_drawerOptions[index].IconSize,
                        color: _drawerOptions[index].IconColor,
                        ),

                        title: Text(_drawerOptions[index].Title,
                        style: TextStyle(fontSize: 17,color: _drawerOptions[index].TitleColor),
                        ),

                        onTap: (){
                          Navigator.pop(context);
                          snackBarKey.currentState.showSnackBar(

                            SnackBar(
                                backgroundColor: Colors.grey[800],
                                content: new Row(
                                  children: <Widget>[

                                    new Icon(Icons.timelapse,size: 30,color: Colors.white,),
                                    new SizedBox(
                                      width: 20,
                                    ),
                                    new Text(_drawerOptions[index].SubTitle,style: TextStyle(color: Colors.white,fontSize: 16),),

                                  ],
                                )
                            ),
                          );

                        },
                      ),

                      ListTile(
                        leading: Icon(Icons.logout,size: 30,color: Colors.grey,),
                        title: Text("SignOut",style: TextStyle(fontSize: 17,color: Colors.white),),
                        onTap: (){
                          instance.signOut();
                        },
                      )
                    ],


                    );

              },
              itemCount: 2,
              ),
            )

          ],
        )
    );
  }
}


class DrawerSnackBarConst{

  IconData Icon;
  Color IconColor,TitleColor;
  String Title,SubTitle;
  double IconSize ;





  DrawerSnackBarConst(this.Icon,
      this.IconColor,
      this.IconSize,
      this.Title,
      this.TitleColor,
      this.SubTitle,

      );
}