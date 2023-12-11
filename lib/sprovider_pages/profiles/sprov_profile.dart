import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lawtrix/sprovider_pages/profiles/sprov_profilecreation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  Map<String, dynamic>? profileData;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    loadProfileData();
  }

  Future<void> loadProfileData() async {
    try {
      var sharedpref = await SharedPreferences.getInstance();
      var token = sharedpref.getString("ProviderToken");
      final response =
      await http.get(Uri.parse('http://localhost:3000/member/655891e393c147e73f8b9ba1'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        print(jsonData);
        setState(() {
          profileData = jsonData;
        });
        startAnimations();
      } else {
        throw Exception('Failed to load profile data');
      }
    } catch (error) {
      final String jsonContent =
      await rootBundle.loadString('assets/json/sprov_profile.json');
      setState(() {
        profileData = json.decode(jsonContent);
      });
      print('Error fetching profile data: $error');
      startAnimations();
    }
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
        title: Text('Professional Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),

            // Profile Image Section
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(profileData?['headerImage'] ?? 'assets/images/logo.png'),
                ),
              ),
            ),

            SizedBox(height: 20),

            // General Information Section
            buildInfoCard(
              'General Information',
              <Widget>[
                buildInfoRow('Name', profileData?['generalInformation']['name'] ?? ''),
                buildInfoRow('Location', profileData?['generalInformation']['location'] ?? ''),
                buildInfoRow('Email', profileData?['generalInformation']['email'] ?? ''),
                buildInfoRow('Phone', profileData?['generalInformation']['phone'] ?? ''),
              ],
            ),

            // Skills Section
            buildSkillsCard(),

            // Notable Cases Section
            buildInfoCard(
              'Notable Cases',
              profileData?['notableCases']?.map<Widget>((notableCase) => buildListItem(notableCase)).toList() ?? [],
            ),

            // Education Section
            buildInfoCard(
              'Education',
              profileData?['education']?.map<Widget>((education) => buildListItem(education)).toList() ?? [],
            ),

            // Awards and Recognitions Section
            buildInfoCard(
              'Awards and Recognitions',
              profileData?['awardsAndRecognitions']?.map<Widget>((award) => buildListItem(award)).toList() ?? [],
            ),

            // Contact Information Section
            buildInfoCard(
              'Contact Information',
              <Widget>[
                buildInfoRow('Website', profileData?['contactInformation']['website'] ?? ''),
                buildInfoRow('LinkedIn', profileData?['contactInformation']['linkedin'] ?? ''),
              ],
            ),

            SizedBox(height: 20),

            // Edit Profile Button
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => ProfileCreationPage(), // Navigate to the ProfileCreationPage
                    ),
                    );// Handle profile editing action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    primary: Colors.purple, // Set button background color to purple
                    onPrimary: Colors.white,
                  ),
                  child: Text('Edit Profile'),
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, List<Widget> content, {Color? backgroundColor}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 5,
      color: backgroundColor,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...content,
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSkillsCard() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Skills',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: profileData?['skills']?.map<Widget>((skill) => buildSkillChip(skill))?.toList() ?? [],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSkillChip(String skill) {
    return Chip(
      label: Text(
        skill,
        style: TextStyle(
          color: Colors.white,

        ),
      ),
      backgroundColor: Colors.purple,
    );
  }

  Widget buildListItem(String item) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        item,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
