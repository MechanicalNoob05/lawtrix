import 'package:flutter/material.dart';

import '../../components/clientNavigation.dart';
import '../../sprovider_pages/profiles/sprov_profile.dart';
import '../../sprovider_pages/profiles/sprov_profilecreation.dart';
import '../../sprovider_pages/dashboard/sprov_home.dart';
import '../../sprovider_pages/sprov_trial/trial1.dart';
import '../forms/requesthome.dart';
import '../trials/explore.dart';

class clientHome extends StatelessWidget {
  const clientHome({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const clientNav(),
        body:  Padding(
          padding: EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DashboardHandler(),
                ),
              );
            },
              child: Text("Home")),

        )
    );
  }
}

