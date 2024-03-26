import 'package:flutter/material.dart';
import 'package:news_application/my_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "Home_Screen";

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
        ),
      ],
    );
  }
}

///https://newsapi.org/v2/top-headlines/sources?apiKey=f61c64c98c894852afb43e35b5e9bf4d
///baseurl -name of API which I will make call
