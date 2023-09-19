import 'package:flutter/material.dart';

import '../../components/navigation_drawer.dart';

class ServiceProviderHome extends StatelessWidget {
  const ServiceProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Services home"),
      drawer: NavDrawer(),
    );
  }
}
