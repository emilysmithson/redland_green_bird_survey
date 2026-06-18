import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../models/news.dart';
import '../../../settings.dart';

class NewsWidget extends StatelessWidget {
  final News? news;

  const NewsWidget({super.key, this.news});

  String _normaliseImageUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme) {
      return url;
    }

    final segments = uri.pathSegments;
    if (uri.host == 'github.com' &&
        segments.length >= 4 &&
        segments[2] == 'blob') {
      return Uri(
        scheme: 'https',
        host: 'raw.githubusercontent.com',
        pathSegments: <String>[segments[0], segments[1], ...segments.skip(3)],
      ).toString();
    }

    return url;
  }

  @override
  Widget build(BuildContext context) {
    final photoUrl = _normaliseImageUrl(news!.photo);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(8),
            decoration: defaultBoxDecoration(color: Colors.green[50]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      Jiffy.parseFromDateTime(
                        news!.dateTime,
                      ).format(pattern: 'do MMMM yyyy'),
                      // style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    news!.title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                if (news!.body.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(news!.body),
                  ),
                if (news!.photo.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Image.network(
                      photoUrl,
                      loadingBuilder:
                          (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent? loadingProgress,
                          ) {
                            if (loadingProgress == null) {
                              return child;
                            }

                            return const Padding(
                              padding: EdgeInsets.all(24),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          },
                      errorBuilder:
                          (
                            BuildContext context,
                            Object error,
                            StackTrace? stackTrace,
                          ) {
                            return Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(24),
                              color: Colors.green[100],
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.broken_image_outlined),
                                  SizedBox(height: 8),
                                  Text(
                                    'This image is no longer available.',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                    ),
                  ),
                if (news!.photoCaption.isNotEmpty) Text(news!.photoCaption),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
