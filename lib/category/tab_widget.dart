import 'package:flutter/material.dart';
import 'package:news_application/category/tab_item.dart';
import 'package:news_application/model/SourcesResponse.dart';
import 'package:news_application/news/news_widget.dart';

class TabWidget extends StatefulWidget {
  List<Source>? listSources;

  TabWidget({required this.listSources});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.listSources!.length,
      child: Column(
        children: [
          TabBar(
              onTap: (index) {
                selectedTab = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.listSources!
                  .map((source) => TabItem(
                      source: source,
                      isSelected:
                          selectedTab == widget.listSources!.indexOf(source)))
                  .toList()),
          Expanded(child: NewsWidget(source: widget.listSources![selectedTab])),
        ],
      ),
    );
  }
}
