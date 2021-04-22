import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/rg_grid_tile.dart';

import '../settings.dart';
import '../widgets/observation_widget.dart';
import 'enter_observations_screen.dart';

class BirdBoxPage extends StatefulWidget {
  final BirdBox birdBox;

  BirdBoxPage({Key key, this.birdBox}) : super(key: key);

  @override
  _BirdBoxPageState createState() => _BirdBoxPageState();
}

class _BirdBoxPageState extends State<BirdBoxPage> {
  @override
  Widget build(BuildContext context) {
    List<Sighting> _sightingList = [];
    Widget content() {
      _sightingList = sightings
          .where((sighting) => sighting.birdBox == widget.birdBox.id - 1)
          .toList();

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  height: 200,
                  decoration: defaultBoxDecoration(color: Colors.green[50]),
                  child: Column(
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Text(widget.birdBox.locationDescription),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: RGGridTile(
                    heroTag: 'greattit',
                    navigateTo: EnterObservationsScreen(),
                    setState: () {
                      setState(() {});
                    },
                    text: 'Enter your own observations for this box',
                    imageAsset: 'assets/greattit.png'),
              ),
            ],
          ),
          Column(
            children: _sightingList.map((Sighting sighting) {
              return observationDetails(sighting, context, false);
            }).toList(),
          )
        ]),
      );
    }

    return PageTemplate(
      title: 'Bird Box ${widget.birdBox.id}',
      image: 'assets/bluetit.png',
      widgetList: [content()],
      gridList: [],
      heroTag: 'starling',
    );
  }
}