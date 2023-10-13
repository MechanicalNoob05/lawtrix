import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Montserrat', // Custom font
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;

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

    // Start the animations with delays
    startAnimations();
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
                      backgroundImage: AssetImage('assets/images/logo.png'),
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
                    Text('Name: John Doe'),
                    Text('Location: New York, USA'),
                    Text('Email: john.doe@example.com'),
                    Text('Phone: +1 (123) 456-7890'),
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
                    Text('Corporate Law'),
                    Text('Criminal Defense'),
                    Text('Family Law'),
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
                    Text('1. Smith v. Jones (2022)'),
                    Text('2. State v. Johnson (2021)'),
                    Text('3. Doe v. Roe (2020)'),
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
                    Text('LL.B. - Harvard Law School'),
                    Text('B.A. in Political Science - Stanford University'),
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
                    Text('Best Lawyer Award (2021)'),
                    Text('Legal Eagle Award (2020)'),
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
                    Text('Website: www.johndoelegal.com'),
                    Text('LinkedIn: linkedin.com/in/johndoe'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
