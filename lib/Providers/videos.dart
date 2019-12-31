import 'package:flutter/material.dart';
import 'video.dart';

class Videos with ChangeNotifier {
  List<Video> _list = [
    Video(
        id: 1,
        imgUrl:
            'https://images.pexels.com/photos/3355161/pexels-photo-3355161.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
        title: 'معلقة عنترة بن شداد مع عبلة',
        catid: 1),
    Video(
        id: 1,
        imgUrl:
            'https://images.pexels.com/photos/2959611/pexels-photo-2959611.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
        title: 'معلقة فراس الحمداني في جوف الليل',
        catid: 1),
    Video(
        id: 1,
        imgUrl:
            'https://images.pexels.com/photos/3206080/pexels-photo-3206080.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
        title: 'خواطر الليل البهيج في وضح النهار الطليع',
        catid: 1),
    Video(
        id: 1,
        imgUrl:
            'https://images.pexels.com/photos/3331010/pexels-photo-3331010.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
        title: 'صباحيات خالدية منتشرة في أفق الجمال',
        catid: 1),
    Video(
        id: 1,
        imgUrl:
            'https://images.pexels.com/photos/3210189/pexels-photo-3210189.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
        title: 'معلقة عنترة بن شداد مع عبلة',
        catid: 1,isFavorite: true),
  ];

  var _showFavoritesOnly = false;

  List<Video> get list {
    return [..._list];
  }

  List<Video> get favlist {
 return _list.where((videoItem) => videoItem.isFavorite == true).toList();
  }

  void showFavoritesOnly(){
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void showNothing(){
    _showFavoritesOnly = false;
     notifyListeners();
  }
}
