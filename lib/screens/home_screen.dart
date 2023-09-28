import 'package:flutter/material.dart';
import 'package:lawtrix/screens/home_screen/advocate_home_screen.dart';
import 'package:lawtrix/screens/settings_screen.dart';
import 'package:lawtrix/screens/trial%20pages/news_screen.dart';
import 'package:lawtrix/screens/trial%20pages/cases_screen.dart';
import 'package:lawtrix/screens/trial%20pages/schedulepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'Schedule',
            ),
            NavigationDestination(
              icon: Icon(Icons.rss_feed_outlined),
              selectedIcon: Icon(Icons.rss_feed),
              label: 'News',
            ),
            NavigationDestination(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              selectedIcon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
      body: <Widget>[
        AdvocateHomePage(),
        CalenderPage(),
        NewsFeed(),
        CasesPage(),
        SettingsPage(),
      ][currentPageIndex],
    );

  }
}

