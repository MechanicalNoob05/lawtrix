import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lawtrix/router/router.dart' as route;
import 'package:lawtrix/screens/onboarding_screen.dart';
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
      var service_provider = sharedpref.getBool("service_provider");

      // var service_provider = null;
      bool isLoggedin = true;
      Timer(const Duration(seconds: 2),(){
        if(service_provider!=null){
          if(service_provider){
            if(isLoggedin){
              Navigator.pushReplacementNamed(context, route.Home );
            }else{
              Navigator.pushReplacementNamed(context, route.Login );
            }
          }else{
            if(isLoggedin){
              Navigator.pushReplacementNamed(context, route.Home );
            }else{
              Navigator.pushReplacementNamed(context, route.Login );
            }
          }
        }else{
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context)=>const Onboarding()
              )
          );
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