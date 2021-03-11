import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/PlantAppFiles/components/my_bottom_nav_bar.dart';
import 'package:flutter_auth/Screens/LoginScreen.dart';
import 'package:flutter_auth/Screens/SingUpScreen.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  FirebaseAuth instance = FirebaseAuth.instance;


  @override
  void initState()  {
    // TODO: before app Start
    super.initState();

    instance.authStateChanges().listen((User user) {
      if( user == null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      }else{
        print("there is a user");
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: new Scaffold(
        body: MyBottomNavBar(),
      ),
    );
  }
}
