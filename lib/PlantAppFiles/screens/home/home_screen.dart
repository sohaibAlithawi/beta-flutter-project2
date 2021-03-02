
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/PlantAppFiles/components/Drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/PlantAppFiles/components/my_bottom_nav_bar.dart';
import 'package:flutter_auth/PlantAppFiles/screens/home/components/body.dart';
import 'package:flutter_auth/PlantAppFiles/screens/PersonalInfoScreen.dart';
import 'package:toast/toast.dart';
import '../../constants.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

     var _snackBarKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _snackBarKey,
      backgroundColor: Colors.black87,
      drawer: DrawerUi(_snackBarKey),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,

      ),
      body: Body(),

    );
  }


}
