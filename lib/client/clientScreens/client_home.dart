import 'package:flutter/material.dart';
import 'package:lawtrix/screens/trial%20pages/fetdata.dart';
import '../../components/clientNavigation.dart';
import '../../sprovider_pages/profiles/sprov_profile.dart';
import '../forms/CreatedRequests.dart';
import '../forms/client_viewreq.dart';
import '../forms/requesthome.dart';
import '../trials/chattrial.dart';
import '../../DiscardedUseful/oldcreatedrequests.dart';

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
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  // builder: (context) =>  ProfilePage(),
                  builder: (context) =>  CaseListWidget('655aedef3c0f33d37e9ee923'),
                ),
              );
            },
              child: const Text("Home")),

        )
    );
  }
}

