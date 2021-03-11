import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/PlantAppFiles/components/my_bottom_nav_bar.dart';
import 'package:flutter_auth/PlantAppFiles/constants.dart';
import 'package:flutter_auth/PlantAppFiles/screens/home/home_screen.dart';
import 'package:flutter_auth/Screens/homePageScreen.dart';
import 'LoginScreen.dart';

class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  var signUp = GlobalKey<ScaffoldState>();
  UserCredential userCredential;
  String email, password,name;
  FirebaseAuth instance =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: signUp,
        body: new Stack(
          children: <Widget>[

            new Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: Colors.blue[500],
                  image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: ExactAssetImage('assets/images/logo.png'))),
              child: Transform.translate(
                child: new Text(
                  "Register new Account!",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                offset: Offset(50, 50),
              ),
            ),

            ScreenBody(context)
          ],
        )
    );
  }

  Widget ScreenBody(BuildContext context) {
    return Transform.translate(
      offset: Offset(0,360),
      child: new Column(
        children: <Widget>[
          new Form(
            child: new Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline,size: 25,),
                        border: OutlineInputBorder(),
                        labelText: "Enter your name",
                        hintText: "name"),
                    onChanged: (value) {
                      setState(() {
                        this.name = value;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,size: 25,),
                        border: OutlineInputBorder(),
                        labelText: "Enter your Email",
                        hintText: "FlutterApp@gmail.com"),
                    onChanged: (value) {
                      setState(() {
                        this.email = value;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline,size: 25,),
                      border: OutlineInputBorder(),
                      labelText: "Enter your Password",
                      hintText: "123Password",
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        this.password = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          //TODO:Login Button & Register Button

          Transform.translate(
            offset: Offset(0,0),
            child: new Column(
              children: [


                Padding(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 70,

                    child: new RaisedButton(

                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                      ),

                      child: Text("Register",
                        style: TextStyle(fontSize: 20, color: Colors.white),),


                      onPressed: () {

                        Registration();
                      },
                    ),
                  ),
                ),

                  Transform.translate(
                    offset: Offset(0,-10),
                    child: new FlatButton(
                        onPressed: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),),);
                        },


                        child: Text("Go back to login ", style: TextStyle(fontSize: 18),)

                    ),
                  )
              ],
            ),
          )


        ],
      ),
    );
  }


 dynamic Registration ()async{



    try{
      if (email.isNotEmpty && password.isNotEmpty){
        print("Email and password not Empty");
      }else{

        signUp.currentState.showSnackBar(
          SnackBar(
            content: new Text(
              "Please full the container of email and password ",
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      }


       userCredential =
      await instance.createUserWithEmailAndPassword(email: this.email.trim(), password: this.password.trim());


      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageScreen()));
    } on FirebaseAuthException catch(error){


      FirebaseExceptionFun(error);

    }

   return userCredential;

 }


  dynamic FirebaseExceptionFun(FirebaseAuthException error){


    //TODO:exception for EMAIL-ALREADY-IN-USE;
    if (error.code == 'email-already-in-use') {
      signUp.currentState.showSnackBar(
        SnackBar(
          content: new Text(
            "Sorry this email is already in use",
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    //TODO:exception for INVALID-EMAIL;
    else if (error.code == 'invalid-email') {

      signUp.currentState.showSnackBar(
        SnackBar(
          content: new Text(
            "Sorry you have entered invalid email",
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    //TODO:exception for WEAK-PASSWORD;

    else if (error.code == 'weak-password') {

      signUp.currentState.showSnackBar(
        SnackBar(
          content: new Text(
            "Please enter a strong password",
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }


  }

  }







