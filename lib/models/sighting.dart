import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Sighting {
  String? id;
  DateTime? dateTime;
  int? birdBox;
  int? bird;
  String? user;
  String? userEmail;
  String? comment;

  Sighting({
    this.id,
    this.dateTime,
    this.birdBox,
    this.user,
    this.bird,
    this.comment,
    this.userEmail,
  });
  static final ValueNotifier<int> observationsNotifier = ValueNotifier<int>(0);
  static final List<Sighting> observations = [];
  static List<Sighting> sightings = [];

  static void addSighting(Sighting _sighting) {
    final DatabaseReference reference =
        FirebaseDatabase.instance.ref().child("observations");
    final String newkey = reference.push().key!;
    reference.child(newkey).set({
      'user': _sighting.user,
      'date_time': _sighting.dateTime!.toIso8601String(),
      'bird_box': _sighting.birdBox,
      'bird': _sighting.bird,
      'userEmail': _sighting.userEmail,
    });
    getSightings();
  }

  static void updateSighting(Sighting _sighting, String id) {
    final DatabaseReference reference =
        FirebaseDatabase.instance.ref().child("observations");
    reference.child(id).update({
      'user': _sighting.user,
      'date_time': _sighting.dateTime!.toIso8601String(),
      'bird_box': _sighting.birdBox,
      'bird': _sighting.bird,
      'userEmail': _sighting.userEmail,
    });
    getSightings();
  }

  static Future<bool> getSightings() async {
    final DatabaseReference reference =
        FirebaseDatabase.instance.ref().child("observations");
    final DatabaseEvent databaseEvent = await reference.once();
    final Map<dynamic, dynamic>? returnedList = databaseEvent.snapshot.value as Map<dynamic, dynamic>?;
    observations.clear();
    if (returnedList == null) {
      return true;
    }

    returnedList.forEach((key, value) {
      observations.add(
        Sighting(
          id: key as String,
          dateTime: DateTime.parse(value['date_time'] as String),
          user: value['user'] as String?,
          userEmail: value['userEmail'],
          bird: value['bird'],
          birdBox: value['bird_box'] as int?,
        ),
      );
    });
    observations
        .sort((Sighting a, Sighting b) => b.dateTime!.compareTo(a.dateTime!));
    sightings = observations.where((sighting) => sighting.bird != 0).toList();
    observationsNotifier.value++;
    return true;
  }
}
