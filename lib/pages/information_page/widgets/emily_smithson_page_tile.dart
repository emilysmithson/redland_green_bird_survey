import 'package:flutter/material.dart';

class EmilySmithsonPageTile extends StatelessWidget {
  const EmilySmithsonPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Emily Smithson\n',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          const Expanded(
            child: Text(
              'This app was created by Emily Smithson, a Bristol app developer.'
              '\n\nTap for more information.',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
