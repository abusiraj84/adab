import '../Providers/videos.dart';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videosData = Provider.of<Videos>(context);
    final list = videosData.favlist;

    return Expanded(
      child: ListView.builder(
        
        itemCount: list.length,
        itemBuilder: (BuildContext context, int i) {
          return Dismissible(
            key: ValueKey(list[i].id),
            child: ListTile(
                title: Parent(
              style: ParentStyle()
                ..borderRadius(all: 10)
                ..height(200)
                ..background.image(url: list[i].imgUrl, fit: BoxFit.cover),
            )),
            background: Container(
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            direction: DismissDirection.startToEnd,
            onDismissed: (dirction){
              list[i].isFavorite =false;
            },
          );
        },
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 1,
        //     childAspectRatio: 3 / 2,
        //     crossAxisSpacing: 5,
        //     mainAxisSpacing: 5),
      ),
    );
  }
}
