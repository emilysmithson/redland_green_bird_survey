import 'package:flutter/material.dart';

class GiorgioPedePageTile extends StatelessWidget {
  const GiorgioPedePageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Giorgio Pede\n',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          const Expanded(
            child: Text(
              'The beautiful photos on this app are all thanks to local photographer Giorgio Pede.'
              '\n\nMany of them were taken on Redland Green.'
              '\n\nTap for more information.',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
