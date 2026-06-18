import 'package:flutter/material.dart';

import '../../models/dyk.dart';
import '../../widgets/page_template.dart';
import 'widgets/flipcard_widget.dart';

class DidYouKnowPage extends StatefulWidget {
  const DidYouKnowPage({super.key});

  @override
  _DidYouKnowPageState createState() => _DidYouKnowPageState();
}

class _DidYouKnowPageState extends State<DidYouKnowPage> {
  final List<DYK> _dykList = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget optionContainer(String title, int index) {
      _dykList.clear();
      _dykList.addAll(
        DYK.didYouKnowList.where((dyk) {
          switch (selectedIndex) {
            case 0:
              return dyk.type == DYKType.general;

            case 1:
              return dyk.type == DYKType.nestBoxes;

            case 2:
              return dyk.type == DYKType.birdNames;

            case 3:
              return dyk.type == DYKType.passerines;

            case 4:
              return dyk.type == DYKType.corvids;

            case 5:
              return dyk.type == DYKType.birdsOfPrey;

            default:
              return false;
          }
        }),
      );
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 100,
          height: 70,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: index == selectedIndex ? Colors.green[50]! : Colors.grey,
                offset: Offset(
                  index == selectedIndex ? 0 : 5.0,
                  index == selectedIndex ? 0 : 5.0,
                ),
                blurRadius: index == selectedIndex ? 0 : 5.0,
              ),
            ],
          ),
          child: Center(child: Text(title, textAlign: TextAlign.center)),
        ),
      );
    }

    return PageTemplate(
      title: 'Did you know?',
      image: 'assets/nuthatch_close.png',
      widgetList: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    optionContainer('General', 0),
                    optionContainer('Nest Boxes', 1),
                    optionContainer('Bird Names', 2),
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    optionContainer('Song Birds (Passerines)', 3),
                    optionContainer('The Crow Family (Corvids)', 4),
                    optionContainer('Birds of Prey', 5),
                  ],
                ),
              ),
              Column(
                children: _dykList
                    .map(
                      (dyk) =>
                          FlipCardWidget(dyk: dyk, key: Key(dyk.question!)),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
      heroTag: 'fact_page',
    );
  }
}
