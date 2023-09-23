import 'package:lawtrix/screens/allSettingsScreenCollection/account_setting_screen.dart';
import 'package:lawtrix/screens/home_screen.dart';
import 'package:lawtrix/screens/login_screen.dart';
import 'package:lawtrix/screens/settings_screen.dart';
import 'package:lawtrix/screens/signup_screen.dart';
import 'package:lawtrix/screens/splash_screen.dart';
import 'package:flutter/material.dart';

const String loginPage = 'login';
const String signupPage = 'signup';
const String homePage = 'home';
const String shopPage = "shop";

const String settingsPage = "settings";
const String accountSettingsPage = "accountSettings";


const String Splash = "splash";


Route<dynamic> generalController(RouteSettings settings){
  switch (settings.name){
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case signupPage:
      return MaterialPageRoute(builder: (context) => const SignupPage());
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case settingsPage:
      return MaterialPageRoute(builder: (context) => const SettingsPage());
      // Pages in settings
    case accountSettingsPage:
      return MaterialPageRoute(builder: (context) => const AccountSettingsPage());
    case Splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
      // Default response
    default:
      throw("Route non existing");
  }
}

