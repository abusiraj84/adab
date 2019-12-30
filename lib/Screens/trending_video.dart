import 'package:adab/Modals/videos.dart';
import '../Widgets/trend_item.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class TrendingVideos extends StatelessWidget {
     final List<Videos> list = [
      Videos(id: 1,imgUrl:   'https://images.pexels.com/photos/3355161/pexels-photo-3355161.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',title: 'معلقة عنترة بن شداد مع عبلة',catid: 1),
      Videos(id: 1,imgUrl:   'https://images.pexels.com/photos/2959611/pexels-photo-2959611.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',title: 'معلقة فراس الحمداني في جوف الليل',catid: 1),
      Videos(id: 1,imgUrl:   'https://images.pexels.com/photos/3206080/pexels-photo-3206080.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',title: 'خواطر الليل البهيج في وضح النهار الطليع',catid: 1),
      Videos(id: 1,imgUrl:   'https://images.pexels.com/photos/3331010/pexels-photo-3331010.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',title: 'صباحيات خالدية منتشرة في أفق الجمال',catid: 1),
      Videos(id: 1,imgUrl:   'https://images.pexels.com/photos/3210189/pexels-photo-3210189.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',title: 'معلقة عنترة بن شداد مع عبلة',catid: 1),
    ];

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
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
                return TrendItem(id: list[i].id, imgUrl: list[i].imgUrl,catid: list[i].catid,title: list[i].title,);
              },
            ),
          )
        ],
      ),
    );
  }
}
