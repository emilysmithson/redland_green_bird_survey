import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/birds.dart';

import '../settings.dart';

class BirdFactPage extends StatefulWidget {
  final Bird bird;
  final String heroKey;

  const BirdFactPage({Key key, this.bird, this.heroKey}) : super(key: key);

  @override
  _BirdFactPageState createState() => _BirdFactPageState();
}

class _BirdFactPageState extends State<BirdFactPage> {
  int imageNumber = 0;
  List<Widget> photoList = [];

  @override
  void initState() {
    for (int i = 0; i < widget.bird.images.length; i++) {
      photoList.add(
        GestureDetector(
          onTap: () {
            setState(() {
              imageNumber = i;
            });
          },
          child: Container(
              margin: const EdgeInsets.all(2),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.bird.images[i],
                  ),
                ),
              )),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: widget.heroKey ?? '${widget.bird.name}1',
                    child: Material(
                      color: Colors.green[100],
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              widget.bird.images[imageNumber],
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              width: double.infinity,
                              height: 60,
                              child: Center(
                                child: FittedBox(
                                  child: Text(widget.bird.name,
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: photoList),
                      ),
                      const SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(16.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration:
                                defaultBoxDecoration(color: Colors.green[50]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text('Conservation status: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                    Text(
                                      widget.bird.conservationStatus ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          .copyWith(
                                            color: widget.bird
                                                        .conservationStatus ==
                                                    'Green'
                                                ? Colors.green
                                                : widget.bird
                                                            .conservationStatus ==
                                                        'Amber'
                                                    ? Colors.amber
                                                    : Colors.red,
                                          ),
                                    ),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text('Scientific Name: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                    Text(widget.bird.scientificName ?? '')
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Expanded(
                                      child: Text('Bird Family: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                    ),
                                    Expanded(
                                        child:
                                            Text(widget.bird.birdFamily ?? ''))
                                  ]),
                                ),
                                if (widget.bird.birdType == BirdType.nesting)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'This species might use one of the nest boxes.',
                                    ),
                                  ),
                                if (widget.bird.birdType == BirdType.other)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        'This species might be seen on the green, but is not one of the species that will use a nest box'),
                                  ),
                                if (widget.bird.birdType == BirdType.predator)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        'This species is a potential predator of eggs or young birds in the bird boxes.'),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                              icon: Icon(Icons.info_outline),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Conservation Status'),
                                      content: Wrap(
                                        runSpacing: 10,
                                        children: [
                                          Text(
                                              'The conservation list puts birds and other UK animals into 3 categories:'),
                                          RichText(
                                            text: TextSpan(
                                              text: 'Green: ',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Birds that are not currently of conservation concern.',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: 'Amber: ',
                                              style: TextStyle(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Birds that show a moderate (25-50%) decrease in breeding populations',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: 'Red: ',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Birds that show the greatest (more than 50%) decrease in breeding populations. These need urgent action to reverse their decline.',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text:
                                                  'This is reviewed every five years and the last review showed that  ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '67 species or more than '
                                                      'a quarter of all UK regularly occuring bird species are now on the red list.',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Dismiss'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      Text(widget.bird.description),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
