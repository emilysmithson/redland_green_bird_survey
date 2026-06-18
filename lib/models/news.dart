import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class News extends Equatable {
  final String title;
  final String headline;
  final String body;
  final String url;
  final String photo;
  final DateTime dateTime;
  final String photoCaption;

  const News({
    required this.title,
    required this.body,
    required this.headline,
    required this.dateTime,
    required this.url,
    required this.photo,
    required this.photoCaption,
  });

  static final newsList = ValueNotifier<List<News>>([]);

  static void addNews(News news) {
    final DatabaseReference reference = FirebaseDatabase.instance.ref().child(
      "news",
    );
    final String newkey = reference.push().key!;
    reference.child(newkey).set({
      'title': news.title,
      'headline': news.headline,
      'body': news.body,
      'url': news.url,
      'photo': news.photo,
      'dateTime': news.dateTime.toIso8601String(),
      'photoCaption': news.photoCaption,
    });
  }

  static Future<bool> getNews() async {
    final DatabaseReference reference = FirebaseDatabase.instance.ref().child(
      "news",
    );
    final DatabaseEvent databaseEvent = await reference.once();
    final Map<dynamic, dynamic>? returnedList =
        databaseEvent.snapshot.value as Map<dynamic, dynamic>?;
    final newsItems = <News>[];
    if (returnedList == null) {
      newsList.value = [];
      return true;
    }

    returnedList.forEach((key, value) {
      newsItems.add(
        News(
          title: value['title'] ?? '',
          dateTime: DateTime.parse(value['dateTime']),
          headline: value['headline'] ?? '',
          body: value['body'] ?? '',
          url: value['url'] ?? '',
          photo: value['photo'] ?? '',
          photoCaption: value['photoCaption'] ?? '',
        ),
      );
    });
    newsItems.sort((News a, News b) => b.dateTime.compareTo(a.dateTime));
    newsList.value = newsItems;
    return true;
  }

  @override
  List<Object> get props {
    return [title, headline, body, url, photo, dateTime, photoCaption];
  }
}
