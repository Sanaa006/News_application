import 'package:flutter/material.dart';
import 'package:news_application/api/api_manager.dart';
import 'package:news_application/model/NewsResponse.dart';
import 'package:news_application/model/SourcesResponse.dart';
import 'package:news_application/news/news_details_screen.dart';
import 'package:news_application/news/news_item.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late ScrollController scrollController;
  int page=1;
  @override
  void initState(){
    super.initState();
    scrollController = ScrollController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySources(widget.source.id ?? "",page),
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
                  ApiManager.getNewsBySources(widget.source.id ?? "",page);
                  setState(() {});
                },
                child: Text("Try again"),
              ),
            ],
          );
        }
        //server(success , error)
        if (snapshot.data?.status != "ok") {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getNewsBySources(widget.source.id ?? "",page);
                  setState(() {});
                },
                child: Text("Try again"),
              ),
            ],
          );
        }
        var listNews = snapshot.data?.articles ?? [];
        return ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, NewsDetailsScreen.routeName,
                    arguments: listNews[index]);
              },
              child: NewsItem(
                news: listNews[index],
              ),
            );
          },
          itemCount: listNews.length,
        );
      },
    );
  }
}
