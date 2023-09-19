import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lawtrix/router/router.dart' as route;

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  var sharedpref = await SharedPreferences.getInstance();
                  sharedpref.setBool("service_provider", true);
                  
                },
                child: const Text("Lawyer")),
            ElevatedButton(
                onPressed: () async {
                  var sharedpref = await SharedPreferences.getInstance();
                  sharedpref.setBool("service_provider", false);
                },
                child: const Text("User"))
          ],
        ),
      ),
    );
  }
}
