import 'package:flutter/material.dart';
import 'package:flutter_auth/PlantAppFiles/screens/FavoriteScreen.dart';
import 'package:flutter_auth/PlantAppFiles/screens/PersonalInfoScreen.dart';
import 'package:flutter_auth/PlantAppFiles/screens/home/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_auth/PlantAppFiles/screens/FavoriteScreen.dart';
import 'package:flutter_auth/PlantAppFiles/screens/PersonalInfoScreen.dart';
import 'package:flutter_auth/PlantAppFiles/screens/home/home_screen.dart';

import '../constants.dart';


class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int currentIndex= 0;

 final tabs= [
   HomeScreen(),
   favoriteScreen(),
   personalInfoScreen(),

 ];
 final BottomNavBarColors= [

      Colors.grey[300],
      Colors.red,
      Colors.blue,

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index:currentIndex ,
        color: Colors.black38,
        animationDuration: Duration(milliseconds: 120),
        backgroundColor: BottomNavBarColors[currentIndex],
        height: 50,
        items: <Widget>[
          Icon(Icons.home, size: 20),
          Icon(Icons.important_devices, size: 20),
          Icon(Icons.movie_creation, size: 20),
        ],


        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
          body: tabs[currentIndex],
    );


  }
}
