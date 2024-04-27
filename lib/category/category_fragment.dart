import 'package:flutter/material.dart';
import 'package:news_application/category/category_item.dart';

import '../model/category_model.dart';

class CategoryFragment extends StatelessWidget {
   var categoryList=CategoryModel.getCategory();
   Function onCatgoryclick;
   CategoryFragment({required this.onCatgoryclick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("pick your category \n of interest",style:Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15
            ) , itemBuilder: (context, index) {
              return InkWell(onTap: (){
                onCatgoryclick(categoryList[index]);
              },child: CategoryItem(categoryModel: categoryList[index], index: index));
            },
              itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
