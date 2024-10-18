import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''Privacy Policy

Effective: October 17,2024

CaptionGenie does not collect, store, or share any personal information or images uploaded by users. All image processing and functionality take place locally on the user's device, and no data is transmitted or stored externally.

Image Uploads:
Images uploaded to CaptionGenie are used solely for generating captions within the app. These images are not stored, shared, or transmitted to any external servers.

No Third-Party Services:
This app does not use any third-party services, APIs, or libraries that would require sharing or collecting data.

Changes to this Privacy Policy:
We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy in this app. You are advised to review this Privacy Policy periodically for any changes.
            ''',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
