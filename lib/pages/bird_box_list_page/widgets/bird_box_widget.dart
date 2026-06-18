import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';

class BirdBoxWidget extends StatelessWidget {
  final BirdBox? birdBox;

  const BirdBoxWidget({super.key, this.birdBox});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      // margin: const EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipOval(
                  child: Hero(
                    tag: "birdbox ${birdBox!.id}",
                    child: Image.asset(birdBox!.boxType.image),
                  ),
                ),
              ),
            ),
            FittedBox(
              child: Text(
                'Bird Box ${birdBox!.id.toString()}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
