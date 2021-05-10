import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/news.dart';
import 'package:redland_green_bird_survey/widgets/news_widget.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Latest News',
      image: 'assets/dunnock.png',
      heroTag: 'welcome',
      widgetList:
          News.newsList.map((News news) => NewsWidget(news: news)).toList(),
    );
  }
}