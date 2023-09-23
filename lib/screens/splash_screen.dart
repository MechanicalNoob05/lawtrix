import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lawtrix/router/router.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    void whereToGo() async{
      var sharedpref = await SharedPreferences.getInstance();
      var isLoggedin = sharedpref.getString("token");
      Timer(const Duration(seconds: 2),(){
        if(isLoggedin!=null){
          if(isLoggedin != null ){
            Navigator.pushReplacementNamed(context, route.homePage );
          }else{
            Navigator.pushReplacementNamed(context, route.loginPage );
          }
        }else{
          Navigator.pushReplacementNamed(context, route.loginPage );
        }
      },);
    }
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Image(
            height: 200,
              width: 200,
              image: AssetImage("assets/images/logo.png"))
      ),
    );
  }
}
// Center(
// child: Image(
// height: 200,
// width: 200,
// image: AssetImage("assets/images/logo.png"))
// ),