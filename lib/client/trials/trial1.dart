// import 'package:flutter/material.dart';
//
// class EditRequests extends StatefulWidget {
//   final Map<String, dynamic> request;
//
//   EditRequests(this.request, {Key? key}) : super(key: key);
//
//   @override
//   _EditRequestsState createState() => _EditRequestsState();
// }
//
// class _EditRequestsState extends State<EditRequests> {
//   late Map<String, dynamic> requestData;
//   bool isEditing = false;
//
//   @override
//   void initState() {
//     super.initState();
//     requestData = Map.from(widget.request);
//   }
//
//   void toggleEditing() {
//     setState(() {
//       isEditing = !isEditing;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Request Details"),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(isEditing ? Icons.save : Icons.edit),
//             onPressed: toggleEditing,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: requestData.keys.map((key) {
//             return ListTile(
//               title: Text(key),
//               subtitle: isEditing
//                   ? buildEditableField(key, requestData[key])
//                   : Text(requestData[key].toString()),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
//
//   Widget buildEditableField(String key, dynamic value) {
//     if (value is String) {
//       return TextFormField(
//         initialValue: value,
//         onChanged: (text) {
//           setState(() {
//             updateNestedValue(requestData, key, text);
//           });
//         },
//       );
//     } else if (value is int) {
//       return TextFormField(
//         initialValue: value.toString(),
//         keyboardType: TextInputType.number,
//         onChanged: (text) {
//           setState(() {
//             updateNestedValue(requestData, key, int.parse(text));
//           });
//         },
//       );
//     } else if (value is List<String>) {
//       return DropdownButton<String>(
//         value: value[0],
//         items: value.map<DropdownMenuItem<String>>((item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: Text(item),
//           );
//         }).toList(),
//         onChanged: (newValue) {
//           setState(() {
//             updateNestedValue(requestData, key, [newValue]);
//           });
//         },
//       );
//     } else if (value is Map<String, dynamic>) {
//       return Column(
//         children: value.keys.map((subKey) {
//           return ListTile(
//             title: Text(subKey),
//             subtitle: buildEditableField(subKey, value[subKey]),
//           );
//         }).toList(),
//       );
//     }
//
//     return Text(value.toString());
//   }
//
//   void updateNestedValue(Map<String, dynamic> data, String key, dynamic newValue) {
//     final keys = key.split('.');
//     dynamic currentData = data;
//     for (var i = 0; i < keys.length - 1; i++) {
//       currentData = currentData[keys[i]];
//     }
//     currentData[keys.last] = newValue;
//   }
//
// }
