
import 'package:flutter/material.dart';
import 'package:news_application/my_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(news.urlToImage ?? " ",


                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.35,
                )),
          ),
          Text(
            news.author ?? "",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: MyTheme.greyColor),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            news.title ?? "",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            calculatePublishedAtAgoForNews(news),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: MyTheme.greyColor),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }

  String calculatePublishedAtAgoForNews(News news) {
    final anHourAgo = (DateTime.now())
        .subtract(Duration(hours: DateTime.parse(news.publishedAt!).hour));
    final timeAgo = (timeago.format(anHourAgo)).toString();
    return timeAgo;
  }
}
