import 'package:flutter/material.dart';
import 'package:news_application/category/category_details.dart';
import 'package:news_application/home/home_screen.dart';
import 'package:news_application/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryDetails.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        CategoryDetails.routeName: (context) => CategoryDetails(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}