import 'package:flutter/material.dart';
import 'package:news_application/model/SourcesResponse.dart';
import 'package:news_application/my_theme.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected == true ? MyTheme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: MyTheme.primaryColor,
        ),
      ),
      child: Text(
        source.name ?? "",
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color:
                isSelected == true ? MyTheme.whiteColor : MyTheme.primaryColor),
      ),
    );
  }
}
