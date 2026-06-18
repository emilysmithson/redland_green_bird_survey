import 'package:animations/animations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';
import 'package:redland_green_bird_survey/pages/bird_box_page/bird_box_type_page.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/pages/home_page/widgets/rg_grid_tile.dart';

import '../../settings.dart';
import '../../widgets/observation_widget.dart';
import '../enter_observations_page/enter_observations_page.dart';
import '../map_page.dart';

class BirdBoxPage extends StatefulWidget {
  final BirdBox birdBox;

  const BirdBoxPage({super.key, required this.birdBox});

  @override
  _BirdBoxPageState createState() => _BirdBoxPageState();
}

class _BirdBoxPageState extends State<BirdBoxPage> {
  @override
  Widget build(BuildContext context) {
    List<Sighting> sightingList = [];
    Widget content() {
      sightingList = Sighting.observations
          .where((sighting) => sighting.birdBox == widget.birdBox.id)
          .toList();

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: defaultBoxDecoration(),
              margin: const EdgeInsets.all(8.0),
              child: OpenContainer(
                transitionDuration: const Duration(milliseconds: 750),
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                closedColor: Colors.green[50]!,
                openBuilder: (context, action) {
                  return MapPage(birdBox: widget.birdBox.id);
                },
                closedBuilder: (context, action) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                      SizedBox(
                        height: 150,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: OpenContainer(
                            closedBuilder: (context, open) => FlutterMap(
                              options: MapOptions(
                                onTap: (_, _) => open(),
                                initialZoom: 17,
                                initialCenter: widget.birdBox.location,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName:
                                      'redland_green_bird_survey',
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: widget.birdBox.location,
                                      width: 40,
                                      height: 40,
                                      alignment: Alignment.topCenter,
                                      child: const Icon(Icons.location_pin),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            openBuilder: (context, close) =>
                                MapPage(birdBox: widget.birdBox.id),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              // height: 100,
              decoration: defaultBoxDecoration(color: Colors.green[50]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'All the bird boxes were cleaned out in February 2021 and January 2022',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(widget.birdBox.boxState),
                ],
              ),
            ),
            SizedBox(
              height: 240,
              width: double.infinity,
              child: Row(
                children: [
                  Flexible(
                    child: RGGridTile(
                      heroTag: 'greattit',
                      navigateTo: EnterObservationsPage(
                        birdBox: widget.birdBox.id,
                      ),
                      setState: () {
                        setState(() {});
                      },
                      text: 'Enter observations for this box',
                      imageAsset: 'assets/greattit2.png',
                    ),
                  ),
                  Flexible(
                    child: RGGridTile(
                      heroTag: 'bird_box_type',
                      navigateTo: BirdBoxTypePage(
                        boxType: widget.birdBox.boxType,
                      ),
                      text: '\nBox type: ${widget.birdBox.boxType.name}',
                      imageAsset: widget.birdBox.boxType.image,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Latest Observations',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            sightingList.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'No observations have been made for this bird box yet.'
                      '\n\nTo enter one, tap the observations button above',
                    ),
                  )
                : Column(
                    children: sightingList.map((Sighting sighting) {
                      return observationDetails(
                        sighting: sighting,
                        context: context,
                        showBoxNo: false,
                        showUser: true,
                      );
                    }).toList(),
                  ),
          ],
        ),
      );
    }

    return PageTemplate(
      title: 'Bird Box ${widget.birdBox.id}',
      image: widget.birdBox.boxType.image,
      widgetList: [content()],
      gridList: const [],
      heroTag: 'birdbox ${widget.birdBox.id}',
    );
  }
}
