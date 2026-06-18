import 'package:flutter/material.dart';

import '../../models/news.dart';
import '../../models/sighting.dart';
import '../../widgets/page_template.dart';
import '../bird_box_list_page/bird_box_list_page.dart';
import '../bird_identifier_page/bird_identifier_page.dart';
import '../enter_observations_page/enter_observations_page.dart';
import '../information_page/information_page.dart';
import '../did_you_know_page/did_you_know.dart';
import '../latest_observations_page.dart';
import '../map_page.dart';
import '../my_details_page/my_details_page.dart';
import '../news_page/news_page.dart';
import '../quiz_page/quiz_page.dart';
import '../welcome_page.dart';
import 'widgets/latest_news_page_tile.dart';
import 'widgets/rg_grid_tile.dart';
import 'widgets/rg_list_tile.dart';
import 'widgets/sightings_page_tile.dart';
import 'widgets/welcome_page_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool>? loading;
  @override
  void initState() {
    News.getNews().then((_) {
      setState(() {});
    });
    Sighting.getSightings().then((_) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Sighting.getSightings();
        setState(() {});
      },
      child: Scaffold(
        body: PageTemplate(
          title: 'Redland Green Bird Box Survey',
          image: 'assets/robin1.png',
          listTileList: const [
            RGListTile(
              navigateTo: WelcomePage(),
              imageAsset: 'assets/bluetit5.png',
              heroTag: 'welcome',
              imageLeft: false,
              alignment: Alignment.centerRight,
              widget: WelcomePageTile(),
            ),
            RGListTile(
              imageAsset: 'assets/goldfinch4.png',
              alignment: Alignment.centerLeft,
              navigateTo: LatestObservationsPage(),
              heroTag: 'goldfinch',
              imageLeft: true,
              widget: SightingsPageTile(),
            ),
            RGListTile(
              imageAsset: 'assets/longtailedtit2.png',
              alignment: Alignment.center,
              navigateTo: NewsPage(),
              heroTag: 'latestNews',
              imageLeft: false,
              widget: LatestNewsPageTile(),
            ),
          ],
          gridList: [
            const RGGridTile(
              heroTag: 'songthrush',
              navigateTo: BirdIdentifierScreen(),
              text: 'Redland Green Birds',
              imageAsset: 'assets/songthrush.png',
            ),
            RGGridTile(
              heroTag: 'greattit',
              navigateTo: const EnterObservationsPage(),
              setState: () {
                setState(() {});
              },
              text: 'Enter observations ',
              imageAsset: 'assets/greattit2.png',
            ),
            const RGGridTile(
              heroTag: 'map_page',
              navigateTo: MapPage(),
              text: 'Map',
              imageAsset: 'assets/dunnock2.png',
            ),
            const RGGridTile(
              heroTag: 'bird_box_list',
              navigateTo: BirdBoxListPage(),
              text: 'Bird Box List',
              imageAsset: 'assets/jay1.png',
            ),
            const RGGridTile(
              heroTag: 'fact_page',
              navigateTo: DidYouKnowPage(),
              text: 'Did you know?',
              imageAsset: 'assets/nuthatch_close.png',
            ),
            const RGGridTile(
              text: 'Quiz',
              imageAsset: 'assets/songthrush.png',
              heroTag: 'quiz',
              navigateTo: QuizPage(),
            ),
            const RGGridTile(
              heroTag: 'information',
              navigateTo: InformationPage(),
              text: 'About',
              imageAsset: 'assets/wagtail.png',
            ),
            const RGGridTile(
              heroTag: 'my_details',
              navigateTo: MyDetailsPage(),
              text: 'My details',
              imageAsset: 'assets/coaltit1.png',
            ),
          ],
          heroTag: 'robin1',
        ),
      ),
    );
  }
}
