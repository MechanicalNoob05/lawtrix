import 'package:flutter/material.dart';
import 'package:lawtrix/providers/theme_provider.dart';
import 'package:lawtrix/themes/dark_theme.dart';
import 'package:lawtrix/themes/light_theme.dart';
import 'package:provider/provider.dart';
import 'package:lawtrix/router/router.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {



    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider())
        ],
        builder: (context, child) {
          final provider = Provider.of<ThemeProvider>(context);


          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Lawtrix',
            darkTheme: provider.followsystem ? darkTheme : provider.theme,
            theme: provider.followsystem ? lightTheme : provider.theme,
            onGenerateRoute: route.generalController,
            initialRoute: route.Splash,
          );
        }
    );
  }
}

