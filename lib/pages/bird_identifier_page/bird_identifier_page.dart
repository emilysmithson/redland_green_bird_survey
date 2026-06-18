import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/birds.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/pages/home_page/widgets/rg_grid_tile.dart';

import 'bird_fact_page.dart';

class BirdIdentifierScreen extends StatefulWidget {
  const BirdIdentifierScreen({super.key});

  @override
  _BirdIdentifierScreenState createState() => _BirdIdentifierScreenState();
}

class _BirdIdentifierScreenState extends State<BirdIdentifierScreen> {
  @override
  Widget build(BuildContext context) {
    List<Bird> birdList = Bird.birdsList
        .where(
          (bird) =>
              bird.birdType == BirdType.nesting ||
              bird.birdType == BirdType.predator ||
              bird.birdType == BirdType.other,
        )
        .toList();

    return PageTemplate(
      title: 'Redland Green Birds',
      image: 'assets/songthrush.png',
      heroTag: 'songthrush',
      gridList: birdList
          .map(
            (bird) => RGGridTile(
              navigateTo: BirdFactPage(bird: bird),
              imageAsset: bird.images![0].asset,
              text: bird.name,
              heroTag: '${bird.name}1',
            ),
          )
          .toList(),
      size: 150,
    );
  }
}
