import 'package:flutter/material.dart';
import 'package:news_application/my_theme.dart';

class HomeDrawer extends StatelessWidget {

  Function NavigatToCatigoryFragment;
  Function NavigatToSetting;
  HomeDrawer({required this.NavigatToCatigoryFragment,required this.NavigatToSetting});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.20,
          color: Theme.of(context).primaryColor,
          child: Center(child: Text("News App!",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,color: MyTheme.whiteColor),)),
        ),
        InkWell(
          onTap: (){
            NavigatToCatigoryFragment();
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Row(
              children: [
                Icon(Icons.list,size: 30,),
                SizedBox(width: 3,),
                Text("Categories",style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){
            NavigatToSetting();
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 3,),
                Text("Settings",style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
