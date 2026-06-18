import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Version {
  static Future<void> checkVersion(BuildContext context) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String currentVersion =
        '${packageInfo.version}+${packageInfo.buildNumber}';

    final DatabaseReference reference = FirebaseDatabase.instance.ref().child(
      "version",
    );
    final DatabaseEvent databaseEvent = await reference.once();
    final String? latestVersion = databaseEvent.snapshot.value as String?;
    if (latestVersion == null) {
      return;
    }

    if (latestVersion != currentVersion && context.mounted) {
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Material(
            child: AlertDialog(
              title: const Text('Please update your app'),
              content: const Text(
                "You are not currently using the latest version of the app. "
                "\n\nPlease download the latest version from the app store.",
              ),
              actions: [
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No thanks"),
                ),
                FilledButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(
                      Platform.isAndroid
                          ? 'https://play.google.com/store/apps/details?id=uk.org.rgcg.redland_green_bird_surveyail'
                          : 'https://apps.apple.com/gb/app/org.uk.rgcg.redlandGreenBirdSurvey/1565525766',
                    );
                    await launchUrl(url, mode: LaunchMode.externalApplication);
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
