import 'package:flutter/material.dart';

import '../../models/news.dart';
import '../../widgets/page_template.dart';
import 'widgets/news_widget.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Latest News',
      image: 'assets/longtailedtit2.png',
      heroTag: 'latestNews',
      widgetList: News.newsList.value
          .map((News news) => NewsWidget(news: news))
          .toList(),
    );
  }
}
