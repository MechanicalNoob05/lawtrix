import 'package:flutter/material.dart';
import 'package:lawtrix/client/ExplorePage/explore.dart';
import 'package:lawtrix/client/forms/singler.dart';

class AppliedRequests extends StatefulWidget {
  final List<Map<String, dynamic>> requests;

  const AppliedRequests(this.requests, {super.key});

  @override
  State<AppliedRequests> createState() => _AppliedRequestsState();
}

class _AppliedRequestsState extends State<AppliedRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.requests.length,
        itemBuilder: (context, index) {
          final request = widget.requests[index];

          return Card(
            child: ListTile(
              title: Text(request['title']),
              subtitle: Text(request['service_details']['description']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RequestDetailsPage(request),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // Adjust placement as needed
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 35, right: 12), // Adjust margin as needed
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ExplorePage()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}