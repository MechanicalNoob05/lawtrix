import 'package:flutter/material.dart';
import 'package:lawtrix/screens/home_screen.dart';
import 'package:lawtrix/screens/login_screen.dart';
import 'package:lawtrix/screens/signup_screen.dart';
import 'package:lawtrix/screens/splash_screen.dart';

const String Splash = "splash";
const String Home = "home";
const String Login = "login";
const String Signup = "signup";


// User routes sab yaha
Route<dynamic> generalController(RouteSettings settings){
  switch (settings.name){
    case Splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case Home:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case Login:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case Signup:
      return MaterialPageRoute(builder: (context) => const SignupPage());
      // Default response
    default:
      throw("Route non existing");
  }
}
