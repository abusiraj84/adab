import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'video.dart';
import 'package:http/http.dart' as http;

class Videos with ChangeNotifier {
  List<Video> _list = [
    Video(
      id: 1,
      imgUrl: 'mOMk7CxA-1w',
      title: 'معلقة عنترة بن شداد مع عبلة',
      catid: 1,
    ),
    Video(
      id: 2,
      imgUrl: 'Tpq-bQL5V0A',
      title: 'معلقة فراس الحمداني في جوف الليل',
      catid: 1,
    ),
    Video(
      id: 3,
      imgUrl: 'V8UXO8LdJP8',
      title: 'خواطر الليل البهيج في وضح النهار الطليع',
      catid: 1,
    ),
    Video(
      id: 4,
      imgUrl: '8jlX7Li8lYU',
      title: 'صباحيات خالدية منتشرة في أفق الجمال',
      catid: 1,
    ),
    Video(
      id: 5,
      imgUrl: 'CwdnyzTwjl4',
      title: 'معلقة عنترة بن شداد مع عبلة',
      catid: 1,
    ),
    Video(
      id: 6,
      imgUrl: 'CwdnyzTwjl4',
      title: 'معلقة عنترة بن شداد مع عبلة',
      catid: 1,
    ),
  ];

  Videos v;
  var _showFavoritesOnly = false;

  List<Video> get list {
    return List.from(_list);
  }

  List<Video> get favlist {
    SharedPreferences sp;

    return _list.where((videoItem) => videoItem.isFavorite).toList();
  }
}
