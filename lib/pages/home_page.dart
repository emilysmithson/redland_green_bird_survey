import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/pages/information_page.dart';
import 'package:redland_green_bird_survey/pages/my_details_page.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';
import 'package:redland_green_bird_survey/widgets/observation_summary.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/rg_grid_tile.dart';
import 'package:redland_green_bird_survey/widgets/rg_list_tile.dart';

import 'bird_identifier_page.dart';
import 'enter_observations_page.dart';
import 'latest_observations_page.dart';
import 'map_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> loading;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _gridList = [
      RGGridTile(
          heroTag: 'nuthatch',
          navigateTo: BirdIdentifierScreen(),
          text: 'Identify birds on the green',
          imageAsset: 'assets/nuthatch.png'),
      RGGridTile(
          heroTag: 'greattit',
          navigateTo: EnterObservationsPage(),
          setState: () {
            setState(() {});
          },
          text: 'Enter your own observations ',
          imageAsset: 'assets/greattit.png'),
      RGGridTile(
          heroTag: 'map_page',
          navigateTo: MapPage(),
          text: 'Map',
          imageAsset: 'assets/longtailedtit.png'),
      RGGridTile(
          heroTag: 'my_details',
          navigateTo: MyDetailsPage(),
          text: 'My details',
          imageAsset: 'assets/coaltit1.png'),
    ];

    final List<Widget> _widgetList = [
      RGListTile(
        navigateTo: InformationPage(),
        imageAsset: 'assets/bluetit.png',
        heroTag: 'bluetit',
        imageLeft: false,
        widget: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Welcome to the Redland Green Bird Box Survey!\n',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                  'In 2018 Redland Green Community Group installed 20 bird boxes all around the green. '
                  '\n\nTap for more information.')
            ],
          ),
        ),
      ),
      RGListTile(
        imageAsset: 'assets/wagtail.png',
        alignment: Alignment.centerLeft,
        navigateTo: LatestObservationsPage(),
        heroTag: 'wagtail',
        imageLeft: true,
        widget: FutureBuilder(
            future: getSightings(),
            builder: (context, snapshot) {
              List<Sighting> _sightingList = sightings
                  .where((sighting) => sighting.bird.name != 'None')
                  .toList();
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Center(
                        child: Text('Latest Sightings',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ),
                    Expanded(
                      child: Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0,
                        children: _sightingList.map((sighting) {
                          return observationSummary(sighting, context);
                        }).toList(),
                      ),
                    )
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    ];

    return RefreshIndicator(
      onRefresh: () async {
        await getSightings();
        setState(() {});
      },
      child: Scaffold(
        body: PageTemplate(
          title: 'Redland Green Bird Survey',
          image: 'assets/robin1.png',
          widgetList: _widgetList,
          gridList: _gridList,
          heroTag: 'robin1',
        ),
      ),
    );
  }
}