
import 'package:adab/Modals/video.dart';
import 'package:flutter/material.dart';
import 'api_service.dart';

class Videos with ChangeNotifier {

  ApiService apiService; 
  
  List<Video> _list = [
    Video(
      id: '1',
      imgUrl: 'mOMk7CxA-1w',
      title: 'معلقة عنترة بن شداد مع عبلة',
      catname: '1',
    ),
    Video(
      id: '2',
      imgUrl: 'Tpq-bQL5V0A',
      title: 'معلقة فراس الحمداني في جوف الليل',
      catname: '1',
    ),
    Video(
      id: '3',
      imgUrl: 'V8UXO8LdJP8',
      title: 'خواطر الليل البهيج في وضح النهار الطليع',
      catname: '1',
    ),
    Video(
      id: '4',
      imgUrl: '8jlX7Li8lYU',
      title: 'صباحيات خالدية منتشرة في أفق الجمال',
      catname: '1',
    ),
    Video(
      id: '5',
      imgUrl: 'CwdnyzTwjl4',
      title: 'معلقة عنترة بن شداد مع عبلة',
      catname: '1',
    ),
    Video(
      id: '6',
      imgUrl: 'CwdnyzTwjl4',
      title: 'معلقة عنترة بن شداد مع عبلة',
      catname: '1',
    ),
  ];


  List<Video> get list {
    return List.from(_list);
  }

  // List<Video> get favlist {
  //   SharedPreferences sp;

  //   return _list.where((videoItem) => videoItem.isFavorite).toList();
  // }
}
