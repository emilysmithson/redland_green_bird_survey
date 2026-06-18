import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/birds.dart';

import '../../settings.dart';

class BirdFactPage extends StatefulWidget {
  final Bird? bird;
  final String? heroKey;

  const BirdFactPage({super.key, this.bird, this.heroKey});

  @override
  _BirdFactPageState createState() => _BirdFactPageState();
}

class _BirdFactPageState extends State<BirdFactPage> {
  int imageNumber = 0;
  List<Widget> photoList = [];

  @override
  void initState() {
    for (int i = 0; i < widget.bird!.images!.length; i++) {
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
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.bird!.images![i].asset),
              ),
            ),
          ),
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
                    tag: widget.heroKey ?? '${widget.bird!.name}1',
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
                              widget.bird!.images![imageNumber].asset,
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            width: double.infinity,
                            height: 60,
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  widget.bird!.name!,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    children: photoList,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: defaultBoxDecoration(color: Colors.green[50]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.info_outline),
                            tooltip: 'Conservation status info',
                            onPressed: () =>
                                _showConservationInfoDialog(context),
                          ),
                        ),
                        Table(
                          columnWidths: const {
                            0: IntrinsicColumnWidth(),
                            1: FlexColumnWidth(),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.top,
                          children: [
                            _factRow(
                              context,
                              label: 'Conservation status',
                              value: widget.bird!.conservationStatus ?? '',
                              valueColor: _conservationStatusColor(
                                widget.bird!.conservationStatus,
                              ),
                            ),
                            _factRow(
                              context,
                              label: 'Scientific name',
                              value: widget.bird!.scientificName ?? '',
                            ),
                            _factRow(
                              context,
                              label: 'Bird family',
                              value: widget.bird!.birdFamily ?? '',
                            ),
                            if (_birdTypeLabel(widget.bird!.birdType) != null)
                              _factRow(
                                context,
                                label: 'Nest boxes',
                                value: _birdTypeLabel(widget.bird!.birdType)!,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: Text(widget.bird!.description!),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Color? _conservationStatusColor(String? status) {
    return switch (status) {
      'Green' => Colors.green,
      'Amber' => Colors.amber,
      'Red' => Colors.red,
      _ => null,
    };
  }

  String? _birdTypeLabel(BirdType? birdType) {
    return switch (birdType) {
      BirdType.nesting => 'Likely to use boxes',
      BirdType.other => 'Unlikely to use boxes',
      BirdType.predator => 'Potential predator',
      null => null,
    };
  }

  TableRow _factRow(
    BuildContext context, {
    required String label,
    required String value,
    Color? valueColor,
  }) {
    final labelStyle = Theme.of(context).textTheme.displayMedium;
    final valueStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
      fontWeight: valueColor != null ? FontWeight.bold : FontWeight.normal,
      color: valueColor,
    );

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 12),
          child: Text(label, style: labelStyle),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(value, style: valueStyle),
        ),
      ],
    );
  }

  void _showConservationInfoDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Conservation Status'),
          content: Wrap(
            runSpacing: 10,
            children: [
              const Text(
                'The conservation lists put birds and other UK animals into '
                'three categories:',
              ),
              RichText(
                text: const TextSpan(
                  text: 'Green: ',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'Birds that are not currently of conservation concern.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Amber: ',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'Birds that show a moderate (25-50%) decrease in '
                          'breeding populations',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Red: ',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'Birds that show the greatest (more than 50%) decrease '
                          'in breeding populations. These need urgent action to '
                          'reverse their decline.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  text:
                      'This is reviewed every five years and the last review '
                      'showed that ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text:
                          '67 species, or more than a quarter of all UK '
                          'regularly occurring bird species, are now on the red '
                          'list.',
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
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Dismiss'),
            ),
          ],
        );
      },
    );
  }
}
