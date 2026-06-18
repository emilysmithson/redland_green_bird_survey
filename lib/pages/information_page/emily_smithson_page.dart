import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../settings.dart';
import '../../widgets/page_template.dart';
import '../leave_app_dialog.dart';

class EmilySmithsonPage extends StatelessWidget {
  const EmilySmithsonPage({super.key});

  static const _websiteUrl = 'https://emilysmithson.github.io';
  static const _linkedInUrl = 'https://www.linkedin.com/in/emily-smithson/';

  Future<void> _launchEmail() async {
    final emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'emily_foulkes@hotmail.com',
      queryParameters: {'subject': 'Redland Green Bird Survey'},
    );
    await launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Emily Smithson',
      image: 'assets/magpie.png',
      heroTag: 'emily_smithson',
      widgetList: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Senior Flutter Developer · Bristol',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Text(
                '\nThis app was designed and built by Emily Smithson, '
                'a Bristol-based app developer with over seven years '
                'of experience shipping Flutter apps to the App Store '
                'and Google Play.\n\n'
                'Emily builds full-stack mobile products — from '
                'community nature apps like this one to production '
                'health apps — with a focus on clean code, testing, '
                'and apps that work well for the people using them.\n\n'
                'She is open to permanent, contract, and '
                'freelance Flutter roles — Bristol, hybrid, or remote.',
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(8),
                decoration: defaultBoxDecoration(color: Colors.green[50]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton.icon(
                      onPressed: () =>
                          showLeaveAppDialogAndLaunchUrl(context, _websiteUrl),
                      icon: const Icon(Icons.language),
                      label: const Text('Visit emilysmithson.github.io'),
                    ),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () =>
                          showLeaveAppDialogAndLaunchUrl(context, _linkedInUrl),
                      icon: const Icon(Icons.work_outline),
                      label: const Text('Connect on LinkedIn'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: _launchEmail,
                      icon: const Icon(Icons.mail_outline_rounded),
                      label: const Text('Email about this app'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
