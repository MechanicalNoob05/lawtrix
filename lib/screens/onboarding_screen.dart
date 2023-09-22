import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lawtrix/router/router.dart' as route;

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Select the what are you looking for",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      child: const Text('Provide Legal Service'),
                      onPressed: () async {
                        var sharedpref = await SharedPreferences.getInstance();
                        sharedpref.setBool("service_provider", true);

                        Navigator.popAndPushNamed(context, route.Home);
                      },
                    ),
                    TextButton(
                      child: const Text('Require Legal Service'),
                      onPressed: () async {
                        var sharedpref = await SharedPreferences.getInstance();
                        sharedpref.setBool("service_provider", false);

                        Navigator.popAndPushNamed(context, route.Home);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
// ElevatedButton(
// onPressed: () async {
// var sharedpref = await SharedPreferences.getInstance();
// sharedpref.setBool("service_provider", true);
//
// Navigator.popAndPushNamed(context, route.Home);
// },
// child: const Text("Lawyer")),
// SizedBox(height: 16.0),
//
// ElevatedButton(
// onPressed: () async {
// var sharedpref = await SharedPreferences.getInstance();
// sharedpref.setBool("service_provider", false);
//
// Navigator.popAndPushNamed(context, route.Home);
// },
// child: const Text("User")),
