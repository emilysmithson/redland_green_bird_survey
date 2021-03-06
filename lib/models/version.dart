import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Version {
  static const String currentVersion = '1.0.6+7';

  static Future checkVersion(BuildContext context) async {
    final DatabaseReference reference =
        FirebaseDatabase.instance.ref().child("version");
    final DatabaseEvent databaseEvent = await reference.once();
<<<<<<< HEAD
    final String? latestVersion = databaseEvent.snapshot.value as String?;
=======
    final String latestVersion = databaseEvent.snapshot.value;
>>>>>>> f7145220ac30b24f80f91788e75572acd6fb1111
    if (latestVersion == null) {
      return true;
    }

    if (latestVersion != currentVersion) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Material(
            child: AlertDialog(
              title: const Text('Please update your app'),
              content: const Text(
                  "You are not currently using the latest version of the app. "
                  "\n\nPlease download the latest version from the app store."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No thanks"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    {
                      String url;
                      if (Platform.isAndroid) {
                        url =
                            'https://play.google.com/store/apps/details?id=uk.org.rgcg.redland_green_bird_surveyail';
                      } else {
                        url =
                            'https://apps.apple.com/gb/app/org.uk.rgcg.redlandGreenBirdSurvey/1565525766';
                      }

                      await canLaunch(url)
                          ? await launch(url)
                          : throw 'Could not launch $url';
                    }
                  },
                  child: const Text('Go to app store'),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
