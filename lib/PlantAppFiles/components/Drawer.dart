
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/PlantAppFiles/screens/PersonalInfoScreen.dart';

import '../constants.dart';

class DrawerUi extends StatelessWidget {
  FirebaseAuth instance =FirebaseAuth.instance;
  DrawerUi(this.snackBarKey);
  var snackBarKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new Stack(
          children: <Widget> [

            new Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black87,
            ),

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

            DrawerOptions(context)
          ],
        ),
      ],
    );
  }

 Widget DrawerOptions(BuildContext context){

    return  Transform.translate(
        offset: Offset(0,30),
        child: new Column(
          children: <Widget>[
            new ListTile(
              leading: Icon(Icons.person,size: 30, color: Colors.grey,),
              title: Text("Personal Information", style: TextStyle(fontSize: 17,color: Colors.white),),
              onTap: (){
                Navigator.pop(context);
                snackBarKey.currentState.showSnackBar(

                  SnackBar(
                      content: new Row(

                    children: <Widget>[

                      new Icon(Icons.timelapse,size: 30,),
                      new SizedBox(
                        width: 20,
                      ),
                      new Text("Sorry the PersonalInfo not Ready Yet",style: TextStyle(color: Colors.grey,fontSize: 16),),

                    ],
                  )
                  ),
                );

              },
            ),

            new ListTile(
              leading: Icon(Icons.settings,size: 30, color: Colors.grey,),
              title: Text("Settings", style: TextStyle(fontSize: 17,color: Colors.white),),
              onTap: (){
                Navigator.pop(context);
                snackBarKey.currentState.showSnackBar(

                  SnackBar(content: new Row(
                    children: <Widget>[

                      new Icon(Icons.timelapse,size: 30,),
                      new SizedBox(
                        width: 20,
                      ),
                      new Text("Sorry the Settings not Ready Yet",style: TextStyle(color: Colors.grey,fontSize: 16),),

                    ],
                  )
                  ),
                );
              },
            ),

            new ListTile(
              leading: Icon(Icons.logout,size: 30, color: Colors.grey,),
              title: Text("SignOut", style: TextStyle(fontSize: 17,color: Colors.white),),
              onTap: (){
                Navigator.pop(context);
                instance.signOut();
              },
            ),
          ],
        )
    );
  }
}
