import 'package:flutter/material.dart';
import 'package:lawtrix/screens/lawyer_Screens/lawyer_home_screen.dart';
import 'package:lawtrix/screens/user_Screens/home_screen.dart';
import 'package:lawtrix/screens/user_Screens/login_screen.dart';
import 'package:lawtrix/screens/user_Screens/signup_screen.dart';
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

// legal routes sab yaha
Route<dynamic> ServicesController(RouteSettings settings){
  switch (settings.name){
    case Splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case Home:
      return MaterialPageRoute(builder: (context) => const ServiceProviderHome());
    default:
      throw("Route non existing");
  }
}