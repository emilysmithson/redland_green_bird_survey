import 'package:flutter/material.dart';

import '../../../../models/bird_box.dart';
import '../../../../pages/map_page.dart';

class SelectBirdBoxNo extends StatefulWidget {
  final int? birdBox;
  final Function? onSelect;
  final BuildContext? context;

  const SelectBirdBoxNo({super.key, this.birdBox, this.onSelect, this.context});
  @override
  _SelectBirdBoxNoState createState() => _SelectBirdBoxNoState();
}

class _SelectBirdBoxNoState extends State<SelectBirdBoxNo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'This section is only for observing birds that are using our bird boxes. '
          'If you spot anything else you would like to share, '
          'please email emily_foulkes@hotmail.com',
        ),
        Expanded(
          child: Center(
            child: GridView.builder(
              padding: const EdgeInsets.all(0),
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
              ),
              itemCount: BirdBox.birdBoxesList.length,
              itemBuilder: (context, index) {
                BirdBox birdBox = BirdBox.birdBoxesList[index];
                return GestureDetector(
                  onTap: () {
                    widget.onSelect!(index + 1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ClipOval(
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(60),
                          ),
                          boxShadow: widget.birdBox != birdBox.id
                              ? [
                                  const BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(3.0, 3.0),
                                    blurRadius: 3.0,
                                  ),
                                ]
                              : [],
                          border: Border.all(
                            width: widget.birdBox == birdBox.id ? 2.0 : 0.0,
                            color: widget.birdBox == birdBox.id
                                ? Colors.blueAccent
                                : Colors.green[50]!,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            birdBox.id.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: Center(
            child: widget.birdBox == -1
                ? Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3.0, 3.0),
                          blurRadius: 3.0,
                        ),
                      ],
                      border: Border.all(width: 0.0, color: Colors.blueAccent),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const MapPage()),
                        );
                      },
                      child: const Text(
                        'Tap here to see the map of where all the bird boxes are located',
                      ),
                    ),
                  )
                : Text(
                    BirdBox
                        .birdBoxesList[widget.birdBox! - 1]
                        .locationDescription,
                  ),
          ),
        ),
      ],
    );
  }
}
