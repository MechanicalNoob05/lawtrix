import 'package:flutter/material.dart';
import 'package:lawtrix/components/navigation_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        // drawer: const NavDrawer(),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(child: Text("Home")),
        ),
      drawer: NavDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () { },
        icon: const Icon(Icons.qr_code),
        label: const Text("Scan"),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

