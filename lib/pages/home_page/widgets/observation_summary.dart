import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redland_green_bird_survey/models/birds.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';

Widget observationSummary(Sighting sighting, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(width: 8),
        Column(
          children: [
            Text(
              Bird.birdsList
                  .firstWhere((bird) => sighting.bird == bird.id)
                  .name!,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              '${DateFormat('d MMM yyyy').format(sighting.dateTime!)}  ${DateFormat.jm().format(sighting.dateTime!)}',
            ),
          ],
        ),
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(child: Text(sighting.birdBox.toString())),
        ),
      ],
    ),
  );
}
