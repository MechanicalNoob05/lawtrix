import 'package:flutter/material.dart';
import '../../components/clientNavigation.dart';
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
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const reqHome(),
                ),
              );
            },
              child: const Text("Home")),

        )
    );
  }
}

