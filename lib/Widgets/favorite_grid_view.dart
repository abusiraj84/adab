import '../Providers/videos.dart';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPreferences sp;

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
                    ..margin(bottom: 20)
                    ..elevation(1)
                    ..background.image(
                        url:
                            'https://img.youtube.com/vi/${list[i].imgUrl}/maxresdefault.jpg',
                        fit: BoxFit.cover),
                  child: Center(
                    child: Parent(
                      style: ParentStyle()
                        ..circle(true)
                        ..background.color(Colors.white)
                        ..padding(all: 5)
                        ..elevation(1),
                      child: Icon(
                        Icons.play_arrow,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  gesture: Gestures()
                    ..isTap((isPressed) => Navigator.pushNamed(
                          context,
                          '/audio-detail',
                          arguments: list[i].id,
                        ))),
            ),
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
            onDismissed: (dirction) {
              list[i].isFavorite = false;
            },
          );
        },
      ),
    );
  }
}
