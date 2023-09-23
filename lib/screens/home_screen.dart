import 'package:flutter/material.dart';
import 'package:lawtrix/components/navigation_drawer.dart';
import 'package:lawtrix/screens/trial%20pages/ajit_trial_screen.dart';
import 'package:lawtrix/screens/trial%20pages/samarth_trial_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'New Cases'),
              Tab(text: 'News'),
            ],
          ),
        ),
        drawer: NavDrawer(),
        body: TabBarView(
          children: [
            SamarthTrialPage(),
            AjitTrialPage(),
          ],
        ),
      ),
    );

  }
}

