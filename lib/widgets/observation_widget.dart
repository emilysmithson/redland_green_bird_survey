import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/bird_box.dart';
import '../models/birds.dart';
import '../models/sighting.dart';
import '../pages/bird_box_page/bird_box_page.dart';
import '../pages/bird_identifier_page/bird_fact_page.dart';
import '../pages/enter_observations_page/enter_observations_page.dart';

Widget observationDetails({
  required Sighting sighting,
  BuildContext? context,
  required bool showBoxNo,
  required bool showUser,
  Function? setState,
}) {
  Bird bird = Bird.birdsList.firstWhere((bird) => sighting.bird == bird.id);

  UniqueKey heroKey = UniqueKey();
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(5.0, 5.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        padding: showUser
            ? const EdgeInsets.all(8)
            : const EdgeInsets.only(top: 24, bottom: 24, left: 8, right: 8),
        margin: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context!,
                  MaterialPageRoute(
                    builder: (context) =>
                        BirdFactPage(bird: bird, heroKey: heroKey.toString()),
                  ),
                );
              },
              child: Hero(
                tag: heroKey.toString(),
                child: ClipOval(
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: bird.images!.isEmpty
                        ? Container(
                            color: bird.name == 'No bird seen'
                                ? Colors.grey[400]
                                : Colors.white,
                            child: Center(
                              child: Text(
                                bird.name == 'No bird seen' ? '' : '?',
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          )
                        : Image.asset(bird.images![0].asset, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bird.name ?? 'No bird seen.',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${DateFormat('d MMMM yyyy').format(sighting.dateTime!)} ${DateFormat.jm().format(sighting.dateTime!)}',
                    ),
                    const SizedBox(height: 4),
                    if (showUser)
                      Text(
                        'Observed by: ${sighting.user}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
              ),
            ),
            if (showBoxNo)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context!,
                    MaterialPageRoute(
                      builder: (context) => BirdBoxPage(
                        birdBox: BirdBox.birdBoxesList[sighting.birdBox! - 1],
                      ),
                    ),
                  );
                },
                child: ClipOval(
                  child: Container(
                    color: Colors.green[100],
                    height: 70,
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(
                        child: Text(
                          'Box no:\n${sighting.birdBox}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      if (!showUser)
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context!,
                MaterialPageRoute(
                  builder: (_) => EnterObservationsPage(sighting: sighting),
                ),
              );
            },
            icon: const Icon(Icons.edit, color: Colors.grey),
          ),
        ),
      if (!showUser)
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context!,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      'Are you sure you want to delete this observation?',
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {
                          final NavigatorState navigator = Navigator.of(
                            context,
                          );
                          final DatabaseReference reference = FirebaseDatabase
                              .instance
                              .ref()
                              .child("observations");
                          await reference.child(sighting.id!).remove();
                          navigator.pop();
                          await Sighting.getSightings();
                          setState!();
                        },
                        child: const Text('Delete'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete, color: Colors.grey),
          ),
        ),
    ],
  );
}
