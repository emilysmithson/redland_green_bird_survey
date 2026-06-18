import 'package:flutter/material.dart';

import '../settings.dart';
import '../widgets/page_template.dart';
import 'enter_observations_page/enter_observations_page.dart';
import 'map_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Welcome to the Redland Green Bird Box Survey',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Text(
              '\nIn 2020, Redland Green Community Group erected nest boxes in trees around the green. There are now 20 boxes to monitor.'
              '\n\nThis app is designed to use community power to help monitor these bird boxes.\n',
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              decoration: defaultBoxDecoration(color: Colors.green[50]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Helping out is as easy as 1 2 3\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MapPage()),
                      );
                    },
                    child: const Text(
                      '1. Find a bird box',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MapPage()),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: Text(
                            'Use the map to help you locate one of the 20 boxes around the Green.\n',
                          ),
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '2. Observe',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Build your observation record from the activity options provided.\n',
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EnterObservationsPage(),
                        ),
                      );
                    },
                    child: const Text(
                      '3. Enter your observation into the app.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EnterObservationsPage(),
                        ),
                      );
                    },
                    child: Row(
                      children: const [
                        Expanded(child: Text('It is quick and easy')),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'There has been a substantial decline in birds (both population numbers and ranges) in the UK '
              'since the end of the Second World War, a decline which is still continuing in many species. '
              '\n\nInstalling bird boxes is one way to help cavity-nesting species: nest boxes provide substitutes '
              'for natural nesting sites and can offer protection from predators. '
              'We have chosen nest boxes which have a long life and are resistant to damage by predators.\n\n',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ];
    return PageTemplate(
      title: 'Information',
      image: 'assets/bluetit5.png',
      heroTag: 'welcome',
      widgetList: widgetList,
    );
  }
}
