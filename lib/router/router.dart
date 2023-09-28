import 'package:device_apps/device_apps.dart';
import 'package:lawtrix/screens/trial%20pages/ltpconv.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:lawtrix/screens/allSettingsScreenCollection/account_setting_screen.dart';
import 'package:lawtrix/screens/home_screen.dart';
import 'package:lawtrix/screens/login_screen.dart';
import 'package:lawtrix/screens/settings_screen.dart';
import 'package:lawtrix/screens/signup_screen.dart';
import 'package:lawtrix/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';


import '../screens/trial pages/iforweb.dart';
import '../screens/trial pages/schedulepage.dart';
import '../screens/trial pages/webframe.dart';

const String loginPage = 'login';
const String signupPage = 'signup';
const String homePage = 'home';
const String shopPage = "shop";

const String settingsPage = "settings";
const String accountSettingsPage = "accountSettings";
const String Cal = 'calendar';
const String nap = 'nap';
const String legalese = 'legalese';
const String Splash = "splash";
const String lawbot = 'lawbot';

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
    case Cal:
      return MaterialPageRoute(builder: (context) =>  CalenderPage());
    case nap:
      open();
      return MaterialPageRoute(builder: (context) => const HomePage());
    case legalese:
      return MaterialPageRoute(builder: (context) => PDFTextViewer());
    case lawbot:
      if(kIsWeb){
        return MaterialPageRoute(builder: (context) => webb());
      }else{
        return MaterialPageRoute(builder: (context) => Weba());
      }
    case Splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
      // Default response
    default:
      throw("Route non existing");
  }
}
// Future<void> openOtherApp() async {
//   final String packageName = "com.example.otherapp"; // Replace with the package name of the other app (Android-specific)
//
//   try {
//     // Try to open the other app using its custom URL scheme (if available)
//     final bool canLaunchCustomScheme = await canLaunch('http://localhost:46028/'); // Replace with the custom URL scheme of the other app
//     if (canLaunchCustomScheme) {
//       await launch('http://localhost:46028/'); // Replace with the custom URL scheme of the other app
//     } else {
//       // If the custom scheme is not available, try a universal app link or website URL (iOS, web, Windows, Linux)
//       final bool canLaunchUniversalLink = await canLaunch('http://localhost:46028/'); // Replace with the universal link or website URL
//       if (canLaunchUniversalLink) {
//         await launch('http://localhost:46028/'); // Replace with the universal link or website URL
//       } else {
//         throw "Could not launch the other app.";
//       }
//     }
//   } catch (e) {
//     throw "Error: $e";
//   }
// }
//web final
// Future<void> openOtherApp() async {
//   final String url = "http://localhost:46028/"; // Replace with the custom URL scheme of the other app
//
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     // If the app is not installed or doesn't handle the URL scheme, open a web page or a fallback URL
//     final String fallbackUrl = "https://openai.com/"; // Replace with a web URL or a fallback URL
//     await launch(fallbackUrl);
//   }
// }

open() async {
  try {
    ///checks if the app is installed on your mobile device
    // DeviceApps.openApp("com.supercell.clashofclans");
    bool isInstalled = await DeviceApps.isAppInstalled('com.example.petco');
    print('xxce');
    print(isInstalled);
    if (isInstalled) {
      DeviceApps.openApp("com.example.petco'");
    } else {
      ///if the app is not installed it lunches google play store so you can install it from there
      launchUrlString("http://localhost:46028/");
    }
  } catch (e) {
    print(e);
  }
}
