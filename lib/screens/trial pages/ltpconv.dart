import 'package:flutter/material.dart';
import 'package:lawtrix/components/navigation_drawer.dart';
import 'dart:convert';
import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:file_picker/file_picker.dart';
import 'constants.dart'; // Import your legal jargons dictionary here
import 'package:http/http.dart' as http;

class PDFTextViewer extends StatefulWidget {
  @override
  _PDFTextViewerState createState() => _PDFTextViewerState();
}

class _PDFTextViewerState extends State<PDFTextViewer> {
  File? _selectedPDF;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _pickPDF() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedPDF = File(result.files.single.path!);
        _textEditingController.text = ''; // Clear the previous text when a new PDF is selected
      });
    }
  }

  Future<void> _extractText() async {
    if (_selectedPDF == null) {
      return;
    }

    final pdfDocument = PdfDocument(inputBytes: _selectedPDF!.readAsBytesSync());
    final StringBuffer buffer = StringBuffer();
    String text = PdfTextExtractor(pdfDocument).extractText();
    buffer.write(text);

    setState(() {
      _textEditingController.text = buffer.toString();
    });

    // Call the evaluate function after extracting text
    evaluate(_textEditingController.text);
  }

  // Function to evaluate and process the extracted text
  void evaluate(String text) {
    // Replace legal jargons with simpler words from the dictionary
    for (var entry in legalJargons.entries) {
      text = text.replaceAll(entry.key, entry.value);
    }

    // Perform grammar check and correction (you can implement this logic)
    // Example: text = performGrammarCheck(text);
    // Set the processed text back to the state
    setState(() {
      _textEditingController.text = text;
    });
  }

  Future<String> performGrammarCheck(String text) async {
    final url = Uri.parse('https://languagetool.org/api/v2/check');
    final response = await http.post(url, body: {
      'text': text,
      'language': 'en-US', // Replace with the desired language code
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> matches = data['matches'];
      String correctedText = text;

      for (final match in matches) {
        final String message = match['message'];
        final int offset = match['offset'];
        final int length = match['length'];
        final String replacement = match['replacements'][0]['value'];

        // Replace the error with the suggested replacement
        correctedText = correctedText.replaceRange(offset, offset + length, replacement);
      }

      return correctedText;
    } else {
      throw Exception('Grammar check failed with status code ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Text Viewer'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickPDF,
              child: Text('Select a PDF Document'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _extractText,
              child: Text('Extract Text'),
            ),
            SizedBox(height: 20),
            if (_selectedPDF != null)
              Expanded(
                child: SingleChildScrollView(
                  child: TextField(
                    controller: _textEditingController,
                    style: TextStyle(fontSize: 16),
                    maxLines: null, // Allow multiple lines
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
