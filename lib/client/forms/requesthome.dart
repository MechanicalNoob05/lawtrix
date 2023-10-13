import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lawtrix/client/forms/reqform.dart';
import 'ongoingRequests.dart';

class reqHome extends StatefulWidget {
  const reqHome({Key? key}) : super(key: key);

  @override
  State<reqHome> createState() => _reqHomeState();
}

class _reqHomeState extends State<reqHome> {
  late Future<List<Map<String, dynamic>>> requests; // Declare as a Future

  @override
  void initState() {
    super.initState();
    // Load the data when the widget is initialized
    requests = loadRequests();
  }

  Future<List<Map<String, dynamic>>> loadRequests() async {
    final data = await DefaultAssetBundle.of(context).loadString('assets/json/templates.json');
    final jsonData = json.decode(data);
    final requestList = jsonData['requests'];
    return List<Map<String, dynamic>>.from(requestList);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabbed App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Ongoing Requests'),
              Tab(text: 'Applied Requests'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              future: requests,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading data'));
                } else {
                  return OngoingRequests(snapshot.data!);
                }
              },
            ),
            AppliedRequests(),
          ],
        ),
      ),
    );
  }
}

class AppliedRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applied Requests'),
      ),
      body: Center(
        child: Text('Applied Requests'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RequestForm()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
