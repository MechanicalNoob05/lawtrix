import 'package:flutter/material.dart';

import '../../components/clientNavigation.dart';

class clientHome extends StatelessWidget {
  const clientHome({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const clientNav(),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(child: Text("Home")),
        )
    );
  }
}

