import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'privacy_policy_screen.dart';
import 'caption_service.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(CaptionGenieApp());
}

class CaptionGenieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaptionGenie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CaptionGenieHomePage(),
      routes: {
        '/privacy_policy': (context) => PrivacyPolicyScreen(),
      },
    );
  }
}

class CaptionGenieHomePage extends StatefulWidget {
  @override
  _CaptionGenieHomePageState createState() => _CaptionGenieHomePageState();
}

class _CaptionGenieHomePageState extends State<CaptionGenieHomePage> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  List<String> selectedCaptions = [];
  Set<String> usedCaptions = Set();

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
        selectedCaptions = [];
      });
    }
  }

  // Function to get captions and ensure no repetition
  void _getCaptions() {
    if (_image == null) return;
    final List<String> allCaptions = getAllCaptions();
    final Random random = Random();

    setState(() {
      selectedCaptions = [];
      while (selectedCaptions.length < 2) {
        String caption = allCaptions[random.nextInt(allCaptions.length)];
        if (!usedCaptions.contains(caption)) {
          selectedCaptions.add(caption);
          usedCaptions.add(caption);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Text(
              'CaptionGenie',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.white,
              child: _image == null
                  ? Center(
                      child: Text(
                        'Upload image.',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : Image.file(
                      File(_image!.path),
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text(
                'Upload Image',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getCaptions,
              child: Text(
                'Get Captions',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              selectedCaptions.isNotEmpty
                  ? selectedCaptions.join("\n\n")
                  : 'Captions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/privacy_policy');
              },
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
