import 'package:flutter/material.dart';

import '../../../models/sighting.dart';
import 'observation_summary.dart';

class SightingsPageTile extends StatelessWidget {
  const SightingsPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Sighting.observationsNotifier,
      builder: (context, dynamic value, child) {
        return Sighting.observations.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Recent Bird Sightings at Boxes',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0,
                      children: Sighting.sightings.map((sighting) {
                        return observationSummary(sighting, context);
                      }).toList(),
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
