import 'package:flutter/material.dart';

import '../my_theme.dart';

class CategoryModel{
  String id;
  String title;
  String imagePath;
  Color color;
  CategoryModel({required this.id, required this.title,required this.color,required this.imagePath});
  //   general
  static List<CategoryModel> getCategory(){
    return [
      CategoryModel(id: 'sports', title: 'Sports', color: MyTheme.redColor, imagePath: "assets/images/sports.png"),
      CategoryModel(id: 'entertainment', title: 'Entertainment', color: MyTheme.blueColor, imagePath: "assets/images/environment.png"),
      CategoryModel(id: 'health', title: 'Health', color: MyTheme.pinkColor, imagePath: "assets/images/health.png"),
      CategoryModel(id: 'business', title: 'Business', color: MyTheme.brownColor, imagePath: "assets/images/bussines.png"),
      CategoryModel(id: 'technology', title: 'Technology', color: MyTheme.blueColor, imagePath: "assets/images/science.png"),
      CategoryModel(id: 'science', title: 'Science', color: MyTheme.yellowColor, imagePath: "assets/images/science.png"),
      CategoryModel(id: 'general', title: 'General', color: MyTheme.darkBlueColor, imagePath: "assets/images/Politics.png"),
    ];
  }
}