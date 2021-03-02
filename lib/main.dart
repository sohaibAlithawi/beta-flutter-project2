import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/LoginScreen.dart';
import 'package:flutter_auth/Screens/homePageScreen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MainPage());
}
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FirebaseAuth",
   debugShowCheckedModeBanner: false,
      home: HomePageScreen()
    );
  }
}

