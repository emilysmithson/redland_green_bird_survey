import 'package:flutter/material.dart';

class WelcomePageTile extends StatelessWidget {
  const WelcomePageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Wrap(
        children: [
          Center(
            child: Text(
              'Welcome!\n',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          const Text(
              'In 2020, Redland Green Community Group installed 16 bird boxes in trees around the green.'
              '\n\nThis app has been created to track the boxes and their inhabitants.'
              '\n\nTap for more information.')
        ],
      ),
    );
  }
}
