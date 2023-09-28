import 'package:lawtrix/screens/trial%20pages/cases_screen.dart';
import 'package:flutter/material.dart';
import 'package:lawtrix/router/router.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(

            decoration: BoxDecoration(

              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xff064469),
                    Color(0xff5790ab),
                  ]),
            ),
            accountEmail: Text("jayeshree@gmail.com"),
            currentAccountPictureSize: Size(50, 50),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
            ),
            accountName: Text(
              "Jayeshree",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.grid_view_sharp),
            title: const Text("Dashboard"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.homePage);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text("Schedule"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.Cal);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Cases"),
            onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                builder: (context)=>const CasesPage()
            )
        );
      },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text("Legalese"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.legalese);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text("LawBot"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.lawbot);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text("user side"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.nap);
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.downloading),
          //   title: const Text("Samarth"),
          //   onTap: (){
          //     Navigator.of(context).push(
          //         MaterialPageRoute(
          //             builder: (context)=>const SamarthTrialPage()
          //         )
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.downloading),
          //   title: const Text("Ajit"),
          //   onTap: (){
          //     Navigator.of(context).push(
          //         MaterialPageRoute(
          //             builder: (context)=>const AjitTrialPage()
          //         )
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: (){
              Navigator.popAndPushNamed(context, route.settingsPage);
            },
          ),
          const Spacer(),
          const Text(
            "Coditt © 2023. All rights reserved.",
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async{
              var sharedpref = await SharedPreferences.getInstance();
              sharedpref.remove("token");
              Navigator.pushReplacementNamed(context, route.loginPage);
            },
          )

        ],
      ),
    );
  }
}
