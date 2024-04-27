import 'package:flutter/material.dart';
import 'package:news_application/model/NewsResponse.dart';
import 'package:news_application/my_theme.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = "news_details_screen";
  late var args;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as News;

    final Uri url = Uri.parse(args.url ?? "");
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset("assets/images/background_Image.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                args.source!.id ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
            body: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          args.urlToImage ?? "",
                          width: double.infinity,
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.35,
                        )),
                  ),
                  Text(
                    args.author ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: MyTheme.greyColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    args.title ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    calculatePublishedAtAgoForNews(args),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: MyTheme.greyColor),
                    textAlign: TextAlign.end,
                  ),
                  Container(
                    color: MyTheme.whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          args.description!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 12, color: MyTheme.greyColor),
                        ),
                        TextButton(
                            onPressed: () {
                              launchmyUrl(url);
                            },
                            child: Text(
                              "View all article",
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Future<void> launchmyUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  String calculatePublishedAtAgoForNews(News news) {
    final anHourAgo = (DateTime.now())
        .subtract(Duration(hours: DateTime.parse(news.publishedAt!).hour));
    final timeAgo = (timeago.format(anHourAgo)).toString();
    return timeAgo;
  }
}
