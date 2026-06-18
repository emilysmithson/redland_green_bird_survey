import 'package:flutter/material.dart';

class WelcomePageTile extends StatelessWidget {
  const WelcomePageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Wrap(
        children: [
          Center(
            child: Text(
              'Welcome!\n',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const Text(
            'In 2020, Redland Green Community Group installed nest boxes in trees around the green. There are now 20 boxes to monitor.'
            '\n\nThis app has been created to track the boxes and their inhabitants.'
            '\n\nTap for more information.',
          ),
        ],
      ),
    );
  }
}
