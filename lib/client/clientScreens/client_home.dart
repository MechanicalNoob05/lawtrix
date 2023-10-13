import 'package:flutter/material.dart';

import '../../components/clientNavigation.dart';
import '../../screens/trial pages/sprov_profile.dart';
import '../../screens/trial pages/sprov_profilecreation.dart';
import '../forms/requesthome.dart';

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
                  builder: (context) => ProfileCreationApp(),
                ),
              );
            },
              child: Text("Home")),

        )
    );
  }
}

