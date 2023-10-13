import 'package:flutter/material.dart';
import 'dart:convert'; // Import the convert library
import 'package:flutter/services.dart';
import 'package:lawtrix/sprovider_pages/profiles/sprov_profilecreation.dart';

import '../../components/navigation_drawer.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;
  Map<String, dynamic>? profileData; // Store the JSON data

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800), // Slower animation
    );

    _offset = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Load and parse the JSON data
    loadProfileData();

    // Start the animations with delays
    startAnimations();
  }

  Future<void> loadProfileData() async {
    // Load and parse the JSON data
    final String jsonContent = await rootBundle.loadString('assets/json/sprov_profile.json');
    setState(() {
      profileData = json.decode(jsonContent);
    });
  }

  Future<void> startAnimations() async {
    await Future.delayed(Duration(milliseconds: 200));
    _controller.forward();
    await Future.delayed(Duration(milliseconds: 200));
    _controller.forward();
    await Future.delayed(Duration(milliseconds: 200));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider Profile'),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header Section
            Hero(
              tag: 'profileImage',
              child: SlideTransition(
                position: _offset,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.blue, Colors.teal],
                    ),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(profileData?['headerImage'] ?? 'assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
            ),

            // General Information Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'General Information',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Name: ${profileData?['generalInformation']['name'] ?? ''}'),
                    Text('Location: ${profileData?['generalInformation']['location'] ?? ''}'),
                    Text('Email: ${profileData?['generalInformation']['email'] ?? ''}'),
                    Text('Phone: ${profileData?['generalInformation']['phone'] ?? ''}'),
                  ],
                ),
              ),
            ),

            // Skills Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Skills',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    for (var skill in profileData?['skills'] ?? [])
                      Text('$skill'),
                  ],
                ),
              ),
            ),

            // Notable Cases Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Notable Cases',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    for (var notableCase in profileData?['notableCases'] ?? [])
                      Text('$notableCase'),
                  ],
                ),
              ),
            ),

            // Education Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Education',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    for (var education in profileData?['education'] ?? [])
                      Text('$education'),
                  ],
                ),
              ),
            ),

            // Awards and Recognitions Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Awards and Recognitions',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    for (var award in profileData?['awardsAndRecognitions'] ?? [])
                      Text('$award'),
                  ],
                ),
              ),
            ),

            // Contact Information Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Contact Information',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Website: ${profileData?['contactInformation']['website'] ?? ''}'),
                    Text('LinkedIn: ${profileData?['contactInformation']['linkedin'] ?? ''}'),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileCreationPage(), // Navigate to the ProfileCreationPage
                    ),
                  );
                },
                child: Text('Edit Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
