import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/page_template.dart';
import 'widgets/list_tile.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    Future<void> openExternalUrl(String url) async {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }

    final List<Widget> widgetList = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            listTile(
              onTap: () async {
                await openExternalUrl(
                  'https://www.instagram.com/giorgio_pede_photography/',
                );
              },
              imageLeft: false,
              imageAsset: 'assets/jay1.png',
              content: [
                const Text(
                  'The beautiful photos on this app are all thanks to local photographer Giorgio Pede.'
                  '\n\nMany of them were taken on Redland Green.'
                  '\n\nTap here to view all his photos on Instagram.',
                ),
                const Icon(Icons.photo_camera_rounded),
              ],
            ),
            listTile(
              onTap: () {
                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'emily_foulkes@hotmail.com',
                  queryParameters: {'subject': 'Redland Green Bird Survey'},
                );

                launchUrl(emailLaunchUri);
              },
              imageLeft: true,
              imageAsset: 'assets/magpie.png',
              content: [
                const Text('This app was created by Emily Smithson'),
                const Text(
                  'If you have any comments or suggestions, please e-mail me at emily_foulkes@hotmail.com',
                ),
                const Icon(Icons.mail_outline_rounded),
              ],
            ),
            listTile(
              onTap: () async {
                await openExternalUrl(
                  'https://sites.google.com/site/redlandgreencommunity/',
                );
              },
              imageLeft: false,
              imageAsset: 'assets/crow2.png',
              content: [
                const Text(
                  'Julie Parker from the Redland Green Community Group contributed to the content of this app.',
                ),
                const Text(
                  'For more information please visit our website www.rgcg.org.uk',
                ),
                const Icon(Icons.navigate_next),
              ],
            ),
            listTile(
              onTap: () async {
                String url;
                if (Platform.isAndroid) {
                  url =
                      'https://play.google.com/store/apps/details?id=uk.org.rgcg.redland_green_bird_survey';
                } else {
                  url =
                      'https://apps.apple.com/gb/app/org.uk.rgcg.redlandGreenBirdSurvey/1565525766';
                }

                await openExternalUrl(url);
              },
              imageLeft: true,
              imageAsset: 'assets/dunnock2.png',
              content: [
                const Text(
                  'If you enjoyed this app, please consider giving it a 5-star rating',
                ),
                const Text('Tap here to be directed to the app store'),
                const Icon(Icons.star),
              ],
            ),
            listTile(
              onTap: () async {
                String url;
                if (Platform.isAndroid) {
                  url =
                      'https://play.google.com/store/apps/details?id=com.flutterdevelopper.redland_green_trail';
                } else {
                  url =
                      'https://apps.apple.com/gb/app/redland-green-tree-trail/id1511416301';
                }
                await openExternalUrl(url);
              },
              imageLeft: false,
              imageAsset: 'assets/bluetit1.png',
              content: [
                const Text('Why not download the Redland Green Tree Trail?'),
                const Text(
                  'It takes you on a stroll of Redland Green and teaches you to identify 20 of the local trees.',
                ),
                const Icon(Icons.nature_rounded),
              ],
            ),
            listTile(
              onTap: () async {
                String url;

                url = 'https://bristolornithologicalclub.co.uk';

                await openExternalUrl(url);
              },
              imageLeft: true,
              imageAsset: 'assets/sparrowhawk_1.png',
              content: [
                const Text(
                  'Huge thanks to Keith Williams of the Bristol '
                  'Ornithological Club for providing us with some '
                  'additional photos.',
                ),
                const Text(
                  'For more information about the club, '
                  'please visit their website. ',
                ),
                const Icon(Icons.link),
              ],
            ),
            listTile(
              onTap: () async {
                String url = 'https://rcas.org.uk';

                await openExternalUrl(url);
              },
              imageLeft: false,
              imageAsset: 'assets/pigeon.png',
              content: [
                const Text(
                  'We are indebted to Redland and Cotham Amenities Society (rcas.org.uk) which funded the purchase of the nest boxes.',
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text('Tap here for more information'),
                ),
                const Icon(Icons.navigate_next),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ];
    return PageTemplate(
      title: 'About',
      image: 'assets/wagtail.png',
      heroTag: 'information',
      widgetList: widgetList,
    );
  }
}
