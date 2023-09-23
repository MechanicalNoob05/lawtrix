import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AjitTrialPage extends StatefulWidget {
  const AjitTrialPage({super.key});

  @override
  State<AjitTrialPage> createState() => _AjitTrialPageState();
}

class _AjitTrialPageState extends State<AjitTrialPage> {
  // Ithe Ajit je karaycha ahe te kar
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["laws"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // Display the data loaded from sample.json
          _items.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.purple.shade50,
                        child: ListTile(
                          title: Text(_items[index]["name"]),
                          subtitle: Text(_items[index]["description"]),
                          trailing: Icon(Icons.arrow_right),
                        ),
                      );
                    },
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
