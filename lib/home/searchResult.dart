import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../model/NewsResponse.dart';
import '../news/news_item.dart';

class SearchResult extends StatefulWidget {
  String keywordSearch;

  SearchResult({required this.keywordSearch});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsForSearch(widget.keywordSearch),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ));
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                "something want wrong",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getNewsForSearch(widget.keywordSearch);
                  setState(() {});
                },
                child: Text("Try again"),
              ),
            ],
          );
        }
        //server(success, error)
        if (snapshot.data == null) {
          return Center(child: Text("No result"));
        } else if (snapshot.hasData) {
          var listNews = snapshot.data!.articles;
          return listNews!.isEmpty
              ? Center(child: Text("No result"))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsItem(
                      news: listNews[index],
                    );
                  },
                  itemCount: listNews.length,
                );
        }
        return Column(
          children: [
            Text(
              "No result",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton(
              onPressed: () {
                ApiManager.getNewsForSearch(widget.keywordSearch);
                setState(() {});
              },
              child: Text("Try again"),
            ),
          ],
        );
      },
    );
  }
}
