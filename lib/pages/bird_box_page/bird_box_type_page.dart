import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/box_type.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

import '../../settings.dart';

class BirdBoxTypePage extends StatelessWidget {
  final BoxType? boxType;

  const BirdBoxTypePage({super.key, this.boxType});
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Bird Box Type: ${boxType!.name}',
      image: boxType!.image,
      widgetList: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          // height: 100,
          decoration: defaultBoxDecoration(color: Colors.green[50]),
          child: Column(
            children: [
              const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(boxType!.description),
              const SizedBox(height: 12),
              const Text(BoxType.generalBirdBoxDescription),
            ],
          ),
        ),
      ],
      heroTag: 'bird_box_type',
    );
  }
}
