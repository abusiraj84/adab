import '../Providers/videos.dart';

import '../Widgets/trend_item.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingVideos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videosData = Provider.of<Videos>(context);
    final list = videosData.list;

    return Parent(
      style: ParentStyle()
        ..height(300)
        ..background.color(Colors.white)
        ..margin(top: 20, right: 10, bottom: 20)
        ..borderRadius(topRight: 30, bottomRight: 30)
        ..boxShadow(color: Colors.grey.shade300, blur: 10, spread: 10),
      child: Column(
        children: <Widget>[
          Parent(
            style: ParentStyle()..margin(bottom: 30)..margin(all: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'الأكثر مشاهدة',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  'الكل',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            height: 230,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int i) {
                return ChangeNotifierProvider.value(
                  value: list[i],
                  child: TrendItem(
                      // id: list[i].id,
                      // imgUrl: list[i].imgUrl,
                      // catid: list[i].catid,
                      // title: list[i].title,
                      ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
