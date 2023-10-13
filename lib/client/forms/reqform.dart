import 'dart:convert';
import 'dart:io'; // Import dart:io

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawtrix/client/forms/req.dart';
import 'package:path_provider/path_provider.dart';

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController TitleController = TextEditingController();
  String selectedServiceType = "Advocates"; // Default value

  List templatesData = [];

  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/json/templates.json');
    final data = json.decode(response);

    setState(() {
      templatesData = data["requests"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  bool isFormValid() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;
  }

  Future<void> saveJsonToFile() async {
    // ... (rest of your saveJsonToFile method)

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Request added successfully!'),
      ),
    );
  }

  Future<String> _getDocumentsPath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    return appDocumentsDirectory.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Request Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Title'),
              TextField(
                controller: TitleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              Text('User Info'),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              Text('Service Details'),
              DropdownButton<String>(
                value: selectedServiceType,
                onChanged: (newValue) {
                  setState(() {
                    selectedServiceType = newValue!;
                  });
                },
                items: <String>[
                  'Advocates',
                  'Arbitrators',
                  'Mediators',
                  'Notaries',
                  'Document Writers',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (isFormValid()) {
                    saveJsonToFile();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => reqpage(),
                      ),
                    );
                  } else {
                    // Show a snackbar with missing field names
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill in all fields.'),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
