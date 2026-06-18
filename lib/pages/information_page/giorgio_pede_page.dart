import 'package:flutter/material.dart';

import '../../settings.dart';
import '../../widgets/page_template.dart';
import '../leave_app_dialog.dart';

class GiorgioPedePage extends StatelessWidget {
  const GiorgioPedePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Giorgio Pede',
      image: 'assets/jay1.png',
      heroTag: 'giorgio_pede',
      widgetList: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Local wildlife photographer',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Text(
                '\nThe beautiful photos throughout this app are all '
                'thanks to Giorgio Pede, a Bristol-based wildlife '
                'photographer with a remarkable eye for birds.\n\n'
                'Many of his images were taken on Redland Green '
                'itself, capturing the very species you might spot '
                'around the nest boxes.\n\n'
                'His work brings the app to life and helps everyone '
                'learn to recognise the birds that visit our green.',
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(8),
                decoration: defaultBoxDecoration(color: Colors.green[50]),
                child: FilledButton.icon(
                  onPressed: () => showLeaveAppDialogAndLaunchUrl(
                    context,
                    'https://www.instagram.com/giorgio_pede_photography/',
                  ),
                  icon: const Icon(Icons.photo_camera_rounded),
                  label: const Text('View photos on Instagram'),
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
