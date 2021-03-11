import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/homePageScreen.dart';
import 'SingUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth instance = FirebaseAuth.instance;
  String email, password;
  var loginKey = GlobalKey<ScaffoldState>();
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: loginKey,
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[


            new Container(
              width: double.infinity,
              height: 380,
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
                  "Hello!",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                offset: Offset(150, 50),
              ),
            ),
            ScreenBody(context)
          ],
        ));
  }

  Widget ScreenBody(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 460),
      child: new Column(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0, -30),
            child: new Form(
              child: new Column(
                children: [

                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline,size: 25,),
                        border: OutlineInputBorder(),
                        labelText: "Enter your email",
                        hintText: "yourname@gmail.com",
                      ),

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
          ),

          //TODO:Login Button & Register Button

          Transform.translate(
            offset: Offset(0, -40),
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
                          borderRadius: BorderRadius.circular(18)),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () async {

                      SignIn();
                      },
                    ),
                  ),
                ),
                new FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingUpScreen()));
                  },
                  child: Text(
                    "Don't have an account ",
                    style: TextStyle(fontSize: 18,color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  dynamic SignIn() async {
    UserCredential _userCredential;
    try {
      _userCredential = await instance.signInWithEmailAndPassword(
          email: this.email.trim(), password: this.password.trim());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePageScreen(),
        ),
      );
    } on FirebaseAuthException catch (error) {


      FirebaseExceptionFun(error);


    }

    return _userCredential;
  }

  dynamic FirebaseExceptionFun(FirebaseAuthException error){


    //TODO:exception for INVALID EMAIL;
    if (error.code == 'invalid-email') {
      loginKey.currentState.showSnackBar(
        SnackBar(
          content: new Text(
            "invalid email",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );

      print("from print invalid email");
    }

    //TODO:exception for USER NOT FOUND;
    else if (error.code == 'user-not-found') {

      loginKey.currentState.showSnackBar(
        SnackBar(
          content: new Text(
            "User not found",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
      print("from print user not found");


    }

    //TODO:exception for wrong password;

    else if (error.code == 'wrong-password') {

      loginKey.currentState.showSnackBar(
        SnackBar(
          content: new Text(
            "Wrong password",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );


    }

    //TODO:exception for user disabled;
    else if (error.code == 'user-disabled') {

      loginKey.currentState.showSnackBar(
        SnackBar(
          content: new Text(
            "Sorry your account has been disabled",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );


    }





  }
}
