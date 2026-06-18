import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../models/news.dart';

class LatestNewsPageTile extends StatelessWidget {
  const LatestNewsPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: News.newsList,
      builder: (context, List<News> news, _) {
        return news.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Latest News',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: news.map((news) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  Jiffy.parseFromDateTime(
                                    news.dateTime,
                                  ).format(pattern: 'do MMMM yyyy'),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.displayMedium,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  news.headline,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
