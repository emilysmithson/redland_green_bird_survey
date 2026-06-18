import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/birds.dart';

Widget selectBird(int bird, Function onSelect) {
  List<Bird> birdList = Bird.birdsList
      .where((bird) => bird.birdType == BirdType.nesting)
      .toList();
  birdList.add(Bird.other);
  birdList.add(Bird.unidentified);
  birdList.add(Bird.none);
  return SizedBox(
    height: 1000,
    child: GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: birdList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onSelect(birdList[index].id);
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.green[50],
              border: Border.all(
                width: bird == birdList[index].id ? 3.0 : 0.0,
                color: Colors.blueAccent,
              ),

              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                colorFilter: birdList[index].images!.isEmpty
                    ? const ColorFilter.mode(Colors.grey, BlendMode.clear)
                    : const ColorFilter.mode(Colors.white, BlendMode.colorBurn),
                fit: BoxFit.fill,
                image: AssetImage(
                  birdList[index].images!.isEmpty
                      ? 'assets/bluetit1.png'
                      : birdList[index].images![0].asset,
                ),
              ),
            ),
            child: Stack(
              children: [
                if (birdList[index] == Bird.other)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 2.0,
                        left: 2.0,
                        bottom: 20,
                        right: 2,
                      ),
                      child: Text(
                        'I saw a bird use the bird box but it was not one listed here.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                if (birdList[index] == Bird.unidentified)
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 2.0,
                      left: 2.0,
                      bottom: 20,
                      right: 2,
                    ),
                    child: Center(
                      child: Text(
                        'I saw a bird use the bird box but I could not tell what it was.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                if (birdList[index] == Bird.none)
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 2.0,
                      left: 2.0,
                      bottom: 20,
                      right: 2,
                    ),
                    child: Center(
                      child: Text(
                        'I waited for 5 minutes but I did not see a bird use the box.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.white60,
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      birdList[index].name!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
