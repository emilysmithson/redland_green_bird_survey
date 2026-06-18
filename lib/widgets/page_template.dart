import 'package:flutter/material.dart';

import '../settings.dart';

class PageTemplate extends StatelessWidget {
  final String title;
  final String image;
  final List<Widget>? widgetList;
  final List<Widget>? gridList;
  final String? heroTag;
  final double? size;
  final List<Widget>? listTileList;

  const PageTemplate({
    super.key,
    required this.title,
    required this.image,
    this.widgetList,
    this.gridList,
    this.heroTag,
    this.size,
    this.listTileList,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: appBackgroundColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(0),
              title: Align(
                alignment: Alignment.bottomCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: double.infinity),
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              background: Hero(
                tag: heroTag!,
                child: Image.asset(
                  image,
                  alignment: const Alignment(0, -1 / 2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (widgetList != null)
            SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return widgetList![index];
              }, childCount: widgetList!.length),
            ), // Re-implementing the above SliverGrid.count example:
          if (listTileList != null)
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                childAspectRatio: 1.8,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return listTileList![index];
              }, childCount: listTileList!.length),
            ),
          if (gridList != null)
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1,
                maxCrossAxisExtent: size ?? 300,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return gridList![index];
              }, childCount: gridList!.length),
            ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).padding.bottom),
          ),
        ],
      ),
    );
  }
}
