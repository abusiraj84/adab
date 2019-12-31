import '../Providers/videos.dart';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final videosData = Provider.of<Videos>(context);
    final list = videosData.favlist;
    

    return Expanded(
      child: GridView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int i) {
           if(list.length==0){
             return  Parent(
            style: ParentStyle()
              ..width(100)
              ..height(100)
              ..elevation(1)
              ..margin(all: 10)
              ..borderRadius(all: 10)
              ..background.color(Colors.orange),
          );
          }else{
            return  Parent(
            style: ParentStyle()
              ..width(100)
              ..height(100)
              ..elevation(1)
              ..margin(all: 10)
              ..borderRadius(all: 10)
              ..background.image(url: list[i].imgUrl,fit: BoxFit.cover),
          );
          }
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),

      ),
    );
  }
}
