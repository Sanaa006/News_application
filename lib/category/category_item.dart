import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_application/model/category_model.dart';
import 'package:news_application/my_theme.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;
  CategoryItem({required this.categoryModel,required this.index});
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(25) ,
          topRight: Radius.circular(25),
          bottomRight: index%2==0?Radius.circular(0):Radius.circular(25),
          bottomLeft:index%2!=0?Radius.circular(0):Radius.circular(25),
        )
      ),
      child: Column(
        children: [
          Image.asset(categoryModel.imagePath,height: MediaQuery.of(context).size.height*0.15,),
          Text(categoryModel.title,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18,color: MyTheme.whiteColor),)
        ],
      ),
    );
  }
}
