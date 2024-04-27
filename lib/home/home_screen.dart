import 'package:flutter/material.dart';
import 'package:news_application/category/category_details.dart';
import 'package:news_application/category/category_fragment.dart';
import 'package:news_application/drawer/home_drawer.dart';
import 'package:news_application/home/searchWedgit.dart';
import 'package:news_application/model/category_model.dart';
import 'package:news_application/my_theme.dart';
import 'package:news_application/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home_Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              index == 1
                  ? "Settings"
                  : (selectedCategory == null
                      ? "News App"
                      : selectedCategory!.title),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05),
                child: IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: customSearchDelegate());
                  },
                  icon: Icon(Icons.search),
                ),
              )
            ],
          ),
          drawer: Drawer(
            child: HomeDrawer(
              NavigatToCatigoryFragment: NavigatToCatigoryFragment,
              NavigatToSetting: NavigatToSetting,
            ),
          ),
          body: index == 1
              ? Settings()
              : (selectedCategory == null
                  ? CategoryFragment(
                      onCatgoryclick: onCatgoryclick,
                    )
                  : CategoryDetails(
                      caterory: selectedCategory!,
                    )),
        ),
      ],
    );
  }

  CategoryModel? selectedCategory;

  void onCatgoryclick(CategoryModel Newcategory) {
    selectedCategory = Newcategory;
    setState(() {});
  }

  int index = 0;

  void NavigatToCatigoryFragment() {
    index = 0;
    selectedCategory = null;
    setState(() {});
  }

  void NavigatToSetting() {
    index = 1;
    setState(() {});
  }
}

///https://newsapi.org/v2/top-headlines/sources?apiKey=f61c64c98c894852afb43e35b5e9bf4d
///baseurl -name of API which I will make call
