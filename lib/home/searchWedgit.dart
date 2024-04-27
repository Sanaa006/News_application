import 'package:flutter/material.dart';
import 'package:news_application/home/searchResult.dart';
import 'package:news_application/my_theme.dart';

class customSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: MyTheme.lightTheme.appBarTheme,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          iconColor: Theme.of(context).primaryColor,
          contentPadding: EdgeInsets.all(9),
          prefixIconColor: Theme.of(context).primaryColor,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          fillColor: MyTheme.whiteColor,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(
            Icons.close,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResult(keywordSearch: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchResult(keywordSearch: query);
  }
}
