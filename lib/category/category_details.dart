import 'package:flutter/material.dart';
import 'package:news_application/api/api_manager.dart';
import 'package:news_application/model/SourcesResponse.dart';
import 'package:news_application/model/category_model.dart';
import 'package:news_application/my_theme.dart';

import '../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = "category_details";
  CategoryModel caterory;

  CategoryDetails({required this.caterory});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse?>(
      future: ApiManager.getSources(widget.caterory.id),
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
                    ApiManager.getSources(widget.caterory.id);
                    setState(() {});
                  },
                  child: Text(
                    "Try again",
                    style: TextStyle(color: MyTheme.whiteColor),
                  ),
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
                        ApiManager.getSources(widget.caterory.id);
                        setState(() {});
                      },
                      child: Text("Try again",
                          style: TextStyle(color: MyTheme.whiteColor))),
                ],
              ),
            ),
          );
        }
        List<Source>? listSources =
            (snapshot.data!.sources ?? "") as List<Source>?;
        return TabWidget(listSources: listSources);
      },
    );
  }
}
