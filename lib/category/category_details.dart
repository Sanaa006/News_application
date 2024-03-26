import 'package:flutter/material.dart';
import 'package:news_application/api/api_manager.dart';
import 'package:news_application/category/tab_widget.dart';
import 'package:news_application/model/SourcesResponse.dart';
import 'package:news_application/my_theme.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = "category_details";

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
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
              "News App",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
          body: FutureBuilder<SourcesResponse?>(
            future: ApiManager.getSources(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: MyTheme.primaryColor,
                  ),
                );
              } else if (snapshot.hasError) {
                ///wrong of clint
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "something want wrong",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ApiManager.getSources();
                          setState(() {});
                        },
                        child: Text("Try again"),
                      ),
                    ],
                  ),
                );
              }
              //server:success , error
              if (snapshot.data?.status != 'ok') {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data?.message ?? "something want wrong"),
                        ElevatedButton(
                            onPressed: () {
                              ApiManager.getSources();
                              setState(() {});
                            },
                            child: Text("Try again")),
                      ],
                    ),
                  ),
                );
              }
              List<Source>? listSources =
                  (snapshot.data!.sources ?? "") as List<Source>?;
              return TabWidget(listSources: listSources);
            },
          ),
        ),
      ],
    );
  }
}
